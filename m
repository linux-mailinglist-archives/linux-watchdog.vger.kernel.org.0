Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB864AFE7B
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Feb 2022 21:32:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231700AbiBIUcX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 9 Feb 2022 15:32:23 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:34048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbiBIUcV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 9 Feb 2022 15:32:21 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92C9FC102FE5
        for <linux-watchdog@vger.kernel.org>; Wed,  9 Feb 2022 12:32:23 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id i17so6411121lfg.11
        for <linux-watchdog@vger.kernel.org>; Wed, 09 Feb 2022 12:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qt7XZb7ztt3+Q+2+ZCPSCc/P2mRXLoxGtptSwv2lrt4=;
        b=ip9kBPPTrXSgADBpt4cEsbBWSMqd+4PMsRZQ3ReUt0OWTX0w4R8JZsyM/OK+t4u09I
         vsG14CHljpEw2vLOHRasB2hbsYHzdHKmYyhip6JVbDQQwZnpCJdA7ux77YP8gbbE0Zwc
         XPZui5pI2Me7MZROxsyv3vaQbrZC51tdBVKlzMNRfcHTwjs+gLrO257OTcZobRuY4wgy
         CDtzVM1uLMZoZlZzYTf+UwdwCCGsuHcjJ+wS87U/sUB70CztfLFXZMclgiIaV8Iemskg
         XRo/OyPVSqFcggLdu/V8onKYIizCfsE/HQ2wddCLZfnUIYuvb+7bSc/krwln5PR3w3uk
         B3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qt7XZb7ztt3+Q+2+ZCPSCc/P2mRXLoxGtptSwv2lrt4=;
        b=Cfn1qmVEHwgzqkCKwOGXp/o1lDp50bXaylFK6RsIsUDkiWFE0Ft+mnAR1sXXW1QSMz
         Pk6oARfPJyH2ht2Gd+zysNFUBR7uHQUHGyAVHJB7JpPlAkrvgTriz6HU4SYTWYV2rvwn
         bpIumKOZXaRkJruymb7BsKE7URIsazkx84Jy6W7ApJrSAcJQrsJCr34/QKkkAMx0QEXt
         awIxXg9W0hHZTiQP7oKStVIxdUzuVLaPHUn2z3FjhkKf3av9Co47D4LBI4JCT5qeuNiK
         iDUET0Q28TA6zBzTsIOCKOMX5nx1PVFb3Nm8gysYmrrfVG9MikwNNMfH0JtDTXQs9sR1
         jKFg==
X-Gm-Message-State: AOAM531LdPQqOeVg0dBOvJUVdLI236xOXiWwgIi5/BSBNWckL4EyZMqE
        Tim8mMel5HTSJ20r9BUgJRE=
X-Google-Smtp-Source: ABdhPJyHUDZS0eyTdRtU5MeGWkSqCN5ApgooMQhe9lrzpDCVFSnK75XESEogo67zZUX4vx1hArIv7A==
X-Received: by 2002:a05:6512:39d6:: with SMTP id k22mr2861824lfu.477.1644438741927;
        Wed, 09 Feb 2022 12:32:21 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id y13sm2500772lfl.263.2022.02.09.12.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 12:32:21 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] watchdog: allow building BCM7038_WDT for BCM4908
Date:   Wed,  9 Feb 2022 21:32:02 +0100
Message-Id: <20220209203202.26395-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

BCM4908 is a SoCs family that shares a lot of hardware with BCM63xx
including the watchdog block. Allow building this driver for it.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/watchdog/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index c8fa79da23b3..ee9c57a5fafa 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1779,7 +1779,7 @@ config BCM7038_WDT
 	tristate "BCM63xx/BCM7038 Watchdog"
 	select WATCHDOG_CORE
 	depends on HAS_IOMEM
-	depends on ARCH_BRCMSTB || BMIPS_GENERIC || BCM63XX || COMPILE_TEST
+	depends on ARCH_BCM4908 || ARCH_BRCMSTB || BMIPS_GENERIC || BCM63XX || COMPILE_TEST
 	help
 	  Watchdog driver for the built-in hardware in Broadcom 7038 and
 	  later SoCs used in set-top boxes.  BCM7038 was made public
-- 
2.34.1

