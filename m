Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29372AC170
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Sep 2019 22:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731976AbfIFUbC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Sep 2019 16:31:02 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41625 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392704AbfIFUbB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Sep 2019 16:31:01 -0400
Received: by mail-wr1-f68.google.com with SMTP id h7so6832514wrw.8
        for <linux-watchdog@vger.kernel.org>; Fri, 06 Sep 2019 13:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DSA+TZh6EFNutVoqp+yeNCXRU52ohS+l6sFwi4Vq/+4=;
        b=n+D8yGsxYXEEMK1jJ/ysdmtsbtc662AikRKLEAI9XjZGCMzjmhYhwOaRkSO/sU0X/O
         vcl14UlaTsYSUWdM0IwhAw1P6V2Rs1hLqS0F5h8M9m1e8xreTdJiQ7cCdYMkSRQF5X6a
         f7IZbgOYv8qjxRrhwx4d6CaGD4KiWNpSvLeXZQn7PkIkBN5Oo6G4BGFUyu0zOToxyuD4
         NdPsXzskMlxdq66gCPoo0qfeKEvxJMu03RiQxiAD+SUvMFU668e5hdkwo9MhAlkV2N/D
         2bauUat5BFh2guV3vQhaGduzVJ3csYtu+7e6qB58dO56MctI+qjqGttjIv4zxVCkOF0f
         IBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DSA+TZh6EFNutVoqp+yeNCXRU52ohS+l6sFwi4Vq/+4=;
        b=YLRAbH6o+C8v3CJpt+cFYsRDQm03XO7qU1M30LphuNak5Mpt3bxDXHWwws3p1REibn
         wGKB+RBHyw3gObLBjvYfsUUjdfFXjPA2IjfRanmazOUz6H0OmwexQs/YPQwbXUAeDuqw
         AonvVx2vXftDzbrz5pDfz34K3YRof28v6GAX8hMDeZTmVzXBtjQGJLJxLPO2nbzpqf1V
         uWXljbv980X+62p1xB2Uqm9dZZEd2342rcHFR10tINuFuyx+1L5eGUAyZD+6iN8Oq20F
         1jSwUzjxUxS73c/pvrjUDmxiDIuegipaAv1EPAce3Rl3gTkqJxXO8mpiy+lyT98/6ZEr
         otzA==
X-Gm-Message-State: APjAAAV/9PUjTgqOkVTZ7oHkD7Kqwele4Yfp+Ws+M0f8VtiTbQ7dctWR
        Zap7/5JkiDZJ3HiTL6acQCO1zA==
X-Google-Smtp-Source: APXvYqz4cAB6gd73DDi1KUZAD7ymLG7prdMzq54Mw0AS8Y5qQR1SGriwe/Mlb0xSHbPsf31iH1QpYg==
X-Received: by 2002:adf:e947:: with SMTP id m7mr9119067wrn.178.1567801859429;
        Fri, 06 Sep 2019 13:30:59 -0700 (PDT)
Received: from localhost.localdomain (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id t13sm13330734wra.70.2019.09.06.13.30.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 06 Sep 2019 13:30:58 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org
Subject: [PATCH 2/2] watchdog: pm8916_wdt: fix missing include
Date:   Fri,  6 Sep 2019 22:30:54 +0200
Message-Id: <20190906203054.26725-2-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190906203054.26725-1-jorge.ramirez-ortiz@linaro.org>
References: <20190906203054.26725-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

As per Documentation/process/submit-checklist.rst, when using  a
facility #include the file that defines/declares  that facility.

Don't depend on other header files pulling in ones that you use.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 drivers/watchdog/pm8916_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/pm8916_wdt.c b/drivers/watchdog/pm8916_wdt.c
index cb5304c26ac3..b8d9df0f96f7 100644
--- a/drivers/watchdog/pm8916_wdt.c
+++ b/drivers/watchdog/pm8916_wdt.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/bitops.h>
+#include <linux/bits.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
2.23.0

