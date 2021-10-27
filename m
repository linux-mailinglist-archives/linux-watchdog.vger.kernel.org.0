Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7F643C21C
	for <lists+linux-watchdog@lfdr.de>; Wed, 27 Oct 2021 07:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239400AbhJ0F0F (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 27 Oct 2021 01:26:05 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:48068
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238090AbhJ0F0E (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 27 Oct 2021 01:26:04 -0400
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 74C483F1A2
        for <linux-watchdog@vger.kernel.org>; Wed, 27 Oct 2021 05:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635312218;
        bh=/eGAYrfmclwdx7jGRlDUTYADEJYv96FFq23ZZIcfgnc=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=OyGBgOMac1mR0H7ZN6Y0zok03Ppxt73c12H7gRlTWKnpxeMEtUiQB7GcwgnznnBwo
         X2BZjICOIdpTh2MhOOkQjyPHKarJ++oVFX6G9O8aTsxEoth66JpAnXAxPre8Nf0pEw
         64hGesDJQEVydY4v1IIARaYdaRL8d1QhcOONcSfTVFLd31l3kApNmOC3EFUY3Wr8pa
         LomkP7IyTS/GGW0tHJdjjUprNOVqWIHU5y2SZJh8u2uGPIC4rf9ZiXN2X19NlkLlPB
         lvFRLJ7Os4ujD8MhuUEZr1CXnHlmCIDVJDgQN0lUVnCDT2rEtfPbuAahgP7BnUrjaw
         YOZUelhE7i3NQ==
Received: by mail-wm1-f70.google.com with SMTP id 128-20020a1c0486000000b0030dcd45476aso755119wme.0
        for <linux-watchdog@vger.kernel.org>; Tue, 26 Oct 2021 22:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/eGAYrfmclwdx7jGRlDUTYADEJYv96FFq23ZZIcfgnc=;
        b=2m03/2AQp3jKoJL1EulWUxAj35wYRTwxUTnMkj5+kvoQUpvtyXEJ4mJGxbFoYa7xRL
         ZtcgKmkro4rSPWjYW1cOUXMzVO+5TtaW1CfikRbLq7EDvxv7Qh4PVTHnXDOIOeSr3l7e
         6D0fALrPB4ax+aV+T7xVh8R3XssIxHz8zyzOym8R+ltoaSMUjHK5N7pEf6MjY0Y6w8En
         hAWFghL1ENR+yAjMREzHMUDKRcIkUC95bUQEQ2G2svipJbZKa67FNqg5wKVFlvnmwRBL
         xIW9mwlLSVX2TNoF9IZq1GTF00nkXhE0zQMMPYuzP4cmjml+ViCjdBUgpRFWWREFXUeB
         mSvA==
X-Gm-Message-State: AOAM5316nVRQtvuf+7nv5sjtfrG23+jGozZ3wDig7Q1ija4yYFaVVQSx
        irSPIEJfUwZTlU85ZodPHU4bEv6KP9oW0XZz/YW4UIEInmjjfMd1KTYue7mH9M5LJ6+hbbaa62l
        EOG2Ed60s0SJxqqMvNjO3a6vnTvAsqvrWV7HfpXegtwDf
X-Received: by 2002:a05:6000:1c3:: with SMTP id t3mr4710487wrx.116.1635312218031;
        Tue, 26 Oct 2021 22:23:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSn0tvEVIOmPrkhfc2HoML7XWosKA97vPocSy4io+emZcEKjdlxBCH/7JaC3wgfcVoNGW6yw==
X-Received: by 2002:a05:6000:1c3:: with SMTP id t3mr4710455wrx.116.1635312217804;
        Tue, 26 Oct 2021 22:23:37 -0700 (PDT)
Received: from alex.home (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr. [2.7.60.249])
        by smtp.gmail.com with ESMTPSA id y23sm2442148wmi.43.2021.10.26.22.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 22:23:37 -0700 (PDT)
From:   Alexandre Ghiti <alexandre.ghiti@canonical.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Cc:     Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH 1/2] dt-bindings: mfd: Fix typo "DA9093" -> "DA9063"
Date:   Wed, 27 Oct 2021 07:23:22 +0200
Message-Id: <20211027052323.1788476-1-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The device described is the "DA9063", not "DA9093", so fix this typo.

Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 Documentation/devicetree/bindings/mfd/da9063.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/da9063.txt b/Documentation/devicetree/bindings/mfd/da9063.txt
index 8da879935c59..91b79a21d403 100644
--- a/Documentation/devicetree/bindings/mfd/da9063.txt
+++ b/Documentation/devicetree/bindings/mfd/da9063.txt
@@ -1,6 +1,6 @@
 * Dialog DA9063/DA9063L Power Management Integrated Circuit (PMIC)
 
-DA9093 consists of a large and varied group of sub-devices (I2C Only):
+DA9063 consists of a large and varied group of sub-devices (I2C Only):
 
 Device                   Supply Names    Description
 ------                   ------------    -----------
-- 
2.30.2

