Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02DE725E33B
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Sep 2020 23:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbgIDVRb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 4 Sep 2020 17:17:31 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:60625 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727923AbgIDVR3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 4 Sep 2020 17:17:29 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 5C5EEAFB;
        Fri,  4 Sep 2020 17:17:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 04 Sep 2020 17:17:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        open-music-kontrollers.ch; h=from:to:cc:subject:date:message-id
        :in-reply-to:references:mime-version:content-transfer-encoding;
         s=fm3; bh=peUDp0pNQ6Mbe/9IFdEaUL4hm+A5G2i/KNTyI2Pd8c8=; b=elaUB
        5TXc6pRBZH3Jg71IsUECbR3LTfcqidjYvD2ufkHvUbw/Zv6qUM07zB0YX/koPtEf
        V7eDlAUcY15hlyIq9laAYCT4ksmqY7mSXYLMOwI65y6Ck5DQhQbniKjKj5DfkfrE
        JeQZYS3t1sV5WL6o9bMV0wk2mkpC0ZdWi/j3KKWdlMXDnb2Yl8lag11zZnqpPpvM
        lQ7JqGqCeQlGFPwfrRoYfqmmfFw5gDqNFcGnlj9hZ2ScZGb54iUGb9a157bP8kF6
        4RRIEEYYtFyG5pi/6W9P6u8qpzqnDjV211D8QCcBAxIM6rDfz1iMMqWo8Eg8Vs0m
        Li+XNNlalYoiluWiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=peUDp0pNQ6Mbe/9IFdEaUL4hm+A5G2i/KNTyI2Pd8c8=; b=Q3VdN5qZ
        XBFIQ5q8uFVjX0uRx/SATV7b7aDUZj6m/lhlPrixKSUgXaA4g7ppUI9W1Rzz+UG3
        73rhM0Imu4HKTKHwIFqmhU0aZwUKZSyT6fZXhBDWb5GJvb2qlpErnbaXe3gKwACZ
        8vwVGFxEyCF+Y0ZBqGng75TjlHABBXSajHwxXzKVxQEcj8OiRHjUN9ECz40k/C26
        iBAosygg0b+bY324V1nuIGslo6o6hHNyurqV30IGTplLG/8gNKDf9mfB6eDBzfwT
        wHoJBWFTDlgeJEBk1mW4vQHr/PT9iFcDwHK1CtEcVsJyvWJAovc2x6Q1yInsOHik
        ZrpfDWn6KqEngw==
X-ME-Sender: <xms:5q5SXxLi810DIf2Jqs5Ee7al3OP63y1dBUH9tsLudXV-asMLhGhuAA>
    <xme:5q5SX9KJgWqS7s13WWC-9s6cx-erP7QG9-6W1MLskeZWEdcnwjl5hjwfOEMtYpk1A
    1x_lsWk297DzXc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegfedgudeitdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefjrghnshhpvghtvghrucfrohhrthhnvghruceouggvvhes
    ohhpvghnqdhmuhhsihgtqdhkohhnthhrohhllhgvrhhsrdgthheqnecuggftrfgrthhtvg
    hrnhepteeugfdvgedvhfejvdevgfffteekueethefhjeevfffgkeejjeefveffveevgfej
    necukfhppeegiedruddvjedruddtledrieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghvsehophgvnhdqmhhushhitgdqkhhonhhtrhho
    lhhlvghrshdrtghh
X-ME-Proxy: <xmx:5q5SX5uy8ttkvPyF8f81YThUGqbaPJKAwK8tjahEtmSaHF4E22pjiw>
    <xmx:5q5SXya6lAi89JYEV2VKCai-c2aU-KtwtvUISX1cBdqHw1ibhxeYWQ>
    <xmx:5q5SX4Yq3RGWtRUFdmdfijyfRfEKQIUnOBLwieT_xiKJ8_9nExBG9Q>
    <xmx:5q5SXzyknhf7jVj5kG_eofUYGJuPbdGgKMHkPBgTQnW6B514JKl9Tg>
Received: from localhost.localdomain (46-127-109-6.dynamic.hispeed.ch [46.127.109.6])
        by mail.messagingengine.com (Postfix) with ESMTPA id 0DA00306005F;
        Fri,  4 Sep 2020 17:17:25 -0400 (EDT)
From:   Hanspeter Portner <dev@open-music-kontrollers.ch>
To:     wim@linux-watchdog.org
Cc:     linux@roeck-us.net, linux-watchdog@vger.kernel.org,
        dev@open-music-kontrollers.ch
Subject: [PATCH 2/2] watchdog: it87_wdt: add IT8784 ID
Date:   Fri,  4 Sep 2020 23:16:39 +0200
Message-Id: <20200904211639.18787-2-dev@open-music-kontrollers.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904211639.18787-1-dev@open-music-kontrollers.ch>
References: <20200904211639.18787-1-dev@open-music-kontrollers.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

IT8784 watchdog works as in IT878x

Tested on SHAREVDY K10 board.

Signed-off-by: Hanspeter Portner <dev@open-music-kontrollers.ch>
---
 drivers/watchdog/it87_wdt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
index 2dac0ba551ce..2b4831842162 100644
--- a/drivers/watchdog/it87_wdt.c
+++ b/drivers/watchdog/it87_wdt.c
@@ -15,7 +15,7 @@
  *	Support of the watchdog timers, which are available on
  *	IT8607, IT8620, IT8622, IT8625, IT8628, IT8655, IT8665, IT8686,
  *	IT8702, IT8712, IT8716, IT8718, IT8720, IT8721, IT8726, IT8728,
- *	IT8772 and IT8783.
+ *	IT8772, IT8783 and IT8784.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
@@ -68,6 +68,7 @@
 #define IT8728_ID	0x8728
 #define IT8772_ID	0x8772
 #define IT8783_ID	0x8783
+#define IT8784_ID	0x8784
 #define IT8786_ID	0x8786
 
 /* GPIO Configuration Registers LDN=0x07 */
@@ -297,6 +298,7 @@ static int __init it87_wdt_init(void)
 	case IT8728_ID:
 	case IT8772_ID:
 	case IT8783_ID:
+	case IT8784_ID:
 	case IT8786_ID:
 		max_units = 65535;
 		break;
-- 
2.28.0

