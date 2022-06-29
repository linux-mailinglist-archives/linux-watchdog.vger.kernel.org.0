Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB0E355FE35
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jun 2022 13:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbiF2LHa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jun 2022 07:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbiF2LHZ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jun 2022 07:07:25 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D00D43D1E8
        for <linux-watchdog@vger.kernel.org>; Wed, 29 Jun 2022 04:07:23 -0700 (PDT)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8940041012
        for <linux-watchdog@vger.kernel.org>; Wed, 29 Jun 2022 11:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1656500842;
        bh=s7/yNxuq40RrKk0Bz5LG0QXWmTYN2ZnVslg7p7peeiE=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=BTR+ebQzdnm4XjQ2PPerIAej5DgqY9ZgiWUBkcsrd/DcUWUSBzMDXuldXSDsV4N9e
         ycZfKNeKa3bQTV2/J/o0ysMOn6cRptN0sxk7rJsENrzbrQ+XVh2dD5IKQ4SkaYk9Sn
         qA2MQQglFEyXL5b1L1JmgZeEJubmuxZNr/VoNJD2v1F6ORamUxUsHQkpRxVTLHaszw
         oI6AEW73sEOS+L+QjXv77RhXh1n1tREFF3Ldwj8EbuvtPTkXRFTi139ucB59wSjFdm
         CbAzifvBZehIj4vgJOlmNTP3f1DWhlnvM0e2y+ndeQuFrOSVNsdPHtjcmKnwkVt0rE
         8DGShLvwLezpA==
Received: by mail-ed1-f72.google.com with SMTP id v16-20020a056402349000b00435a1c942a9so11788729edc.15
        for <linux-watchdog@vger.kernel.org>; Wed, 29 Jun 2022 04:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s7/yNxuq40RrKk0Bz5LG0QXWmTYN2ZnVslg7p7peeiE=;
        b=cp9U1k7KUxb8V932UjeqFQpx/8o/kllWEZ6BwMSAw7ohmihJIA8KcFUgFVawetSxND
         LamHENeE7QhxG9nIwMlEFwNgrFbExaHlYWKaMaeUYi5s+UvyaSJupWDNCohmDhWK3ePX
         ihP1WVSakQ0TPDjtX114utmbhdqnIMJWyxVemkKlvnTrb3RcZE6iC/u78/4WNG7AecAI
         qULIPcdsLXV2ageioFKF8dR5MU6poOOmGFFSi1+3QBNT+I0+WGugsO+5KP2jz3qxCiNN
         5a+eCkgWTTrq6kegdeLsuVV/Tpinesl45GSpxOBE7uywPNq7IIhgEfag7+SN9sBqC1TD
         MDWA==
X-Gm-Message-State: AJIora/AQnBs0k8+RL7e5vjAGyDwablKXpIboUG30RUz0QPRPpt5P41d
        OGuBkNrUpX+g6lK8caaPz4eVlAR5qs8qzewJm7GlGjPoJMif0ATpG3kvdxKmMAf+Ew7NLfYS3Wi
        bDnKVDdZZJDntQlelmtlErbgu0lUATAlNKG4/hTj+v5VW
X-Received: by 2002:a17:906:6545:b0:722:7c99:1ad7 with SMTP id u5-20020a170906654500b007227c991ad7mr2738179ejn.325.1656500841105;
        Wed, 29 Jun 2022 04:07:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sKWzKffTLYTO8eiGO8f6TCl+ogtMvFqx7iN8S/I3sXiDkEvulKUNZaeOvQuHQ0kxAuN1DX5A==
X-Received: by 2002:a17:906:6545:b0:722:7c99:1ad7 with SMTP id u5-20020a170906654500b007227c991ad7mr2738159ejn.325.1656500840947;
        Wed, 29 Jun 2022 04:07:20 -0700 (PDT)
Received: from Isaac-Laptop.fritz.box ([2a02:908:672:1020:dd2a:5258:a4c9:43ea])
        by smtp.gmail.com with ESMTPSA id r1-20020aa7cb81000000b004357b717a96sm11127630edt.85.2022.06.29.04.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 04:07:20 -0700 (PDT)
From:   Isaac True <isaac.true@canonical.com>
To:     linux-watchdog@vger.kernel.org
Cc:     devicetree@vger.kernel.org, wim@linux-watchdog.org,
        linux@roeck-us.net, Isaac True <isaac.true@canonical.com>
Subject: [PATCH 1/2] dt-bindings: watchdog: gpio: add minimum interval
Date:   Wed, 29 Jun 2022 13:06:25 +0200
Message-Id: <20220629110626.2158127-1-isaac.true@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add the "min_hw_margin_ms" parameter to gpio_wdt devices, allowing a
minimum interval to be specified, stopping watchdog devices from being
fed too quickly if they require a certain interval between feeds.

Signed-off-by: Isaac True <isaac.true@canonical.com>
---
 Documentation/devicetree/bindings/watchdog/gpio-wdt.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt b/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
index 198794963786..4f13dbbf12fd 100644
--- a/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
@@ -12,6 +12,8 @@ Required Properties:
     the opposite level disables the WDT. Active level is determined
     by the GPIO flags.
 - hw_margin_ms: Maximum time to reset watchdog circuit (milliseconds).
+- min_hw_margin_ms: Minimum time to reset watchdog circuit (milliseconds).
+  Defaults to 0 ms.
 
 Optional Properties:
 - always-running: If the watchdog timer cannot be disabled, add this flag to
-- 
2.34.1

