Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 300E643C9BE
	for <lists+linux-watchdog@lfdr.de>; Wed, 27 Oct 2021 14:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236316AbhJ0MeM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 27 Oct 2021 08:34:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231497AbhJ0MeL (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 27 Oct 2021 08:34:11 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E52BC061570
        for <linux-watchdog@vger.kernel.org>; Wed, 27 Oct 2021 05:31:46 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id o26so4467581ljj.2
        for <linux-watchdog@vger.kernel.org>; Wed, 27 Oct 2021 05:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DBJEXKjPWdO6SQsEQrFSVQShmKG4dPUMxntiNdrcVaw=;
        b=aOPjhWiaR3deogJbrFTwA0+Vuy9fA0rAwd1z7fyKb7tLwU6CgCJcIjHl8bu4ie76M7
         0YoHNVIhKiLGxjSxgvPCIpN7AV3NTeTmBrZf0cvmATQ5tAnHghoFVGU2EagSpz+QKpNL
         Jv7D/gB8MtZr1vo7JBcxrF2fPxQlcOlTXzuPjNcfsA5KLCk3+QSlYPOYlJaNVsC1D1yE
         Byk6pfuw+2cWvOnn6sAWvLHc+slqHZ9df/uaKyE1E4Epw4siNrLHxg18mZPc0TQkdy9Y
         TQHJGLlykLWrXJMLr9fIGObElKfV2d9l31VDDsdTOpsko9mvApDkS4SuVPz3g6lwyMbL
         Ux2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DBJEXKjPWdO6SQsEQrFSVQShmKG4dPUMxntiNdrcVaw=;
        b=IYz0xvCDOm2eqSuLccnhUKpCQ+QbKOy/1vuChvmZm8NBMR3QUHC5ScUkgu0EJzS4Gf
         7BXB4ADB5BAj+SqTJB8ljFdu0FgR7yIMPJUaaLKOT1TuckVMcj9LKTxtdwFd/0v0MWpH
         I2pUtlcizoM4xM0lvsGphVSARDMLsgSRcwrB0fHtyYd0pY9BHGelToJ68hh3SpgJiGVw
         giwfCQuaqTWET8JFpSonDGGvQKK8cI0Nvr/NaTX3rScEMEeISZnJtAn4dZPbeRCf8y1h
         MuxmB58NtkBHr56STNcB4ZfqykotR24AT430vJWv2jyyeUq7oAnQ4/oBFwoBhaMeXe+L
         slig==
X-Gm-Message-State: AOAM530TDhlN9dEOkfLB7ZtVWaogdTm/cefKGTbUuJppGfU2EbCMyE54
        oDVuOL27rDVMHlamf+G578g=
X-Google-Smtp-Source: ABdhPJwDIz24rQAI4I4K1Pz3/R8jRw/r7P665fu0NsKwc5huVWS0DWYY/l2UDQGXRSdP1RClp4Q/sA==
X-Received: by 2002:a05:651c:889:: with SMTP id d9mr33454617ljq.198.1635337904770;
        Wed, 27 Oct 2021 05:31:44 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id t192sm523409lff.52.2021.10.27.05.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 05:31:43 -0700 (PDT)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] watchdog: bcm63xx_wdt: fix fallthrough warning
Date:   Wed, 27 Oct 2021 14:31:35 +0200
Message-Id: <20211027123135.27458-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This fixes:
drivers/watchdog/bcm63xx_wdt.c: In function 'bcm63xx_wdt_ioctl':
drivers/watchdog/bcm63xx_wdt.c:208:17: warning: this statement may fall through [-Wimplicit-fallthrough=]

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/watchdog/bcm63xx_wdt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/watchdog/bcm63xx_wdt.c b/drivers/watchdog/bcm63xx_wdt.c
index 7cdb25363ea0..56cc262571a5 100644
--- a/drivers/watchdog/bcm63xx_wdt.c
+++ b/drivers/watchdog/bcm63xx_wdt.c
@@ -207,6 +207,8 @@ static long bcm63xx_wdt_ioctl(struct file *file, unsigned int cmd,
 
 		bcm63xx_wdt_pet();
 
+		fallthrough;
+
 	case WDIOC_GETTIMEOUT:
 		return put_user(wdt_time, p);
 
-- 
2.31.1

