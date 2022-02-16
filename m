Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 221924B80D0
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Feb 2022 07:48:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbiBPGso (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 16 Feb 2022 01:48:44 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:36604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiBPGsn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 16 Feb 2022 01:48:43 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F5A4205779
        for <linux-watchdog@vger.kernel.org>; Tue, 15 Feb 2022 22:48:24 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id q17so2223742edd.4
        for <linux-watchdog@vger.kernel.org>; Tue, 15 Feb 2022 22:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rC8eSdmDcVP3N8Qli+Q8TtO59DrQuKVP62/JDY7Qnqg=;
        b=IfGmEtdc533Z9eVnGX4vSB2HgiZrcZoUQ/DNsHLDMQ8tV98F7Hjtgs3DRVEHUnYRg0
         lufFDrwsrxg4YkNKWSSpN/vXgru14avSg6G6dv1W236dav/4vgGzdVXJm03pAA1jUcz4
         P8/ywUPyfd4w3EThotugbc3cwzzAxM/e91Q3RqRl8WU5/wXBhnrQy0YrVQMPzBzPx1n6
         yOtsrcpfvDIwxn8FnlM5MN0AsasgDu48ddb3A2EShQgs21QIyDbJt0mCV9r48keoAWNl
         QewMI9SagOxyROWA9LCoSMNrjz6Jp+ksn16B2pisTmzpNArmesiCNeqcgEg8E+YejtIn
         dsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rC8eSdmDcVP3N8Qli+Q8TtO59DrQuKVP62/JDY7Qnqg=;
        b=xQacNsE+oIxsSpvgoYSDqmvanLMS53W97fT9+/+7gAJnuI9urxPtxdqo5BIJNRKhRC
         1el1XFVKJjj4v3yDH/bETvn3qIY23A0A0yPIBR0j3c49IBD1CdEIkyaN+wACNM3Z87DX
         uhCdxkda7KZg5dRQhabP1kx2vIsp2xNa8h7O7SATAHxDNIivxFSeU534x1QnXok+xpSc
         8xVmzdBLjUWnGnMTqV3lzjBgxcLSwcsTAgTpqp5cFjW3v8QbMslNT1NR1HXGVg0NiLFl
         Chfq3P7g2E80jtVt7GDZt9SFErxVzY1GIpJkbZbXAlxJfFSDwaP4M0udhY8QKgV7Tzj1
         dTsg==
X-Gm-Message-State: AOAM533JtLhNRonKji0ypUtTAA4xvMB/CTad44jh0lRD/vq0A6X3jsu5
        4un0lJ2q8QoAjrC2fNwntA4ycSOYxFY=
X-Google-Smtp-Source: ABdhPJx4+wQA2aaC255EY+dEEqh/3wdt25IGbdHPRlldnLn6rVv5+3Pf0lJtp7tHcFtxYokaAMqJbw==
X-Received: by 2002:a05:6512:3e29:b0:442:3cbd:a2b1 with SMTP id i41-20020a0565123e2900b004423cbda2b1mr1015601lfv.550.1644993256766;
        Tue, 15 Feb 2022 22:34:16 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id br18sm4719588lfb.302.2022.02.15.22.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 22:34:16 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] watchdog: bcm7038_wdt: Support BCM6345 compatible string
Date:   Wed, 16 Feb 2022 07:34:08 +0100
Message-Id: <20220216063408.23168-1-zajec5@gmail.com>
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

A new "compatible" value has been added in the commit 17fffe91ba36
("dt-bindings: watchdog: Add BCM6345 compatible to BCM7038 binding").
It's meant to be used for BCM63xx SoCs family but hardware block can be
programmed just like the 7038 one.

Cc: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/watchdog/bcm7038_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/bcm7038_wdt.c b/drivers/watchdog/bcm7038_wdt.c
index 8656a137e9a4..1ffcf6aca6ae 100644
--- a/drivers/watchdog/bcm7038_wdt.c
+++ b/drivers/watchdog/bcm7038_wdt.c
@@ -218,6 +218,7 @@ static SIMPLE_DEV_PM_OPS(bcm7038_wdt_pm_ops, bcm7038_wdt_suspend,
 			 bcm7038_wdt_resume);
 
 static const struct of_device_id bcm7038_wdt_match[] = {
+	{ .compatible = "brcm,bcm6345-wdt" },
 	{ .compatible = "brcm,bcm7038-wdt" },
 	{},
 };
-- 
2.34.1

