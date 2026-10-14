package com.kedu.commons;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kedu.dao.QuizDAO;
import com.kedu.dao.UsersDAO;

@Service
public class QuizService {

    @Autowired
    private QuizDAO quizDAO;

    @Autowired
    private UsersDAO usersDAO;

    @Transactional
    public int submitQuiz(
            String memberId,
            List<Integer> quizIds,
            List<String> userAnswers) {

        int correctCount = quizDAO.saveQuizResult(
                memberId, quizIds, userAnswers);

        int earnedPoint =
                correctCount * quizDAO.selectPointPerCorrect();

        int updateRows =
                usersDAO.updatePoint(memberId, earnedPoint);

        if (updateRows != 1) {
            throw new IllegalStateException(
                    "�룷�씤�듃 �쟻由쎌뿉 �떎�뙣�뻽�뒿�땲�떎.");
        }

        return correctCount;
    }
    
}