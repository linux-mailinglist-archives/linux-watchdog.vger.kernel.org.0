Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2F607C5BEC
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Oct 2023 20:49:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233197AbjJKSts (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 Oct 2023 14:49:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235156AbjJKSt1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Oct 2023 14:49:27 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 230C1FD
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Oct 2023 11:49:24 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-405505b07dfso8641985e9.0
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Oct 2023 11:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697050162; x=1697654962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FgJ/7naBRQKhRElToskQM4otc1CmC67cgJuQduNWUps=;
        b=HqWmYC1avMOyVGAOb4vEY3ObZYrmdm7yB7fU7FnWSOdmVyg9dxjjiMRoaIylNZy6g9
         R660hdz9bNEzbmUs81PuP9pSE/X+Z7IQks3VKkVOLSFz96+HvV7Iqdh/6R4OuzvF+++b
         E5On0joeeHymbTY64MPVRPf5Wc70i3vIgWMtLHpO2qOinwRNCGbKZpV2Khht81Z69gOX
         dxlV1GAeryvhRdSZdfrnGGkq3QT6gRZtX7hyk66/SkEhbG8uexwpHL/5PNqaDadSVsw5
         HjYU7QQJ4zJuXRtR7dgsJVEkL+wilvIws1/bE4x4+eMlYxfqN1esMddpORsry+5G0lVJ
         Dnfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050162; x=1697654962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FgJ/7naBRQKhRElToskQM4otc1CmC67cgJuQduNWUps=;
        b=rzQzVHuxHhpdG+6wLu7YFDPPNUh4YhJeEFUpo7dyt+0w/jL33A/Q+KT98a/vOAfORp
         7FWsCxen8xQHAwSjkT+UfNonzKlG/ltS1NRmzzmzUQ6x+aKpliu2eBdBgO6ajuhHBQQQ
         +xIPFIdqIYe4pj17u3cLDm2X6kvGC53qUP+UdwJ1HaAgQtO5bS9uuHvi0jkKE0T6GP69
         VI5OxJwe3t9y+w94ygyUrSxklf4hsi4y5ohotYRSW/QJfLqIuMPyWhAgyQ38OcG6C8jQ
         eX5y2S06UsT4kNxvQtYYeTh831kRV/9JxoA2RW9Nb9KXwUTiAGIvBRUiMkMRo0SBclrT
         poXA==
X-Gm-Message-State: AOJu0YxBCBXiDnjwyI24bkbWm+R9+HRLFnEmF8itmQDU1k+/zjXEbb0p
        XAUX0uFSF/8rn+JGXWEcXqazEQ==
X-Google-Smtp-Source: AGHT+IGXIncbrSVnXFsw31+dPbUFZsuW5LP+KcoSDBk5dbYHKJ5XXEJEcavVBGvEpxx1gudGoyEOoA==
X-Received: by 2002:a5d:4449:0:b0:323:31a6:c1db with SMTP id x9-20020a5d4449000000b0032331a6c1dbmr16126566wrr.21.1697050162608;
        Wed, 11 Oct 2023 11:49:22 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id v6-20020adff686000000b0031980294e9fsm16003875wrp.116.2023.10.11.11.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 11:49:22 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v3 08/20] dt-bindings: serial: samsung: Add google-gs101-uart compatible
Date:   Wed, 11 Oct 2023 19:48:11 +0100
Message-ID: <20231011184823.443959-9-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231011184823.443959-1-peter.griffin@linaro.org>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add dedicated google-gs101-uart compatible to the dt-schema for
representing uart of the Google Tensor gs101 SoC.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index 8bd88d5cbb11..6e807b1b4d8c 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -24,6 +24,7 @@ properties:
       - enum:
           - apple,s5l-uart
           - axis,artpec8-uart
+          - google,gs101-uart
           - samsung,s3c2410-uart
           - samsung,s3c2412-uart
           - samsung,s3c2440-uart
-- 
2.42.0.655.g421f12c284-goog

