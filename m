Return-Path: <linux-watchdog+bounces-62-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 763E4800F3C
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Dec 2023 17:11:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A60DC1C20C25
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Dec 2023 16:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D99D4C611;
	Fri,  1 Dec 2023 16:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tmzh80pH"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F2241980
	for <linux-watchdog@vger.kernel.org>; Fri,  1 Dec 2023 08:11:03 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40a4848c6e1so19941805e9.1
        for <linux-watchdog@vger.kernel.org>; Fri, 01 Dec 2023 08:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701447062; x=1702051862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7gV2bTYZ/8fGxngk+WgJOxqZzJsxGLjpBfcpof/uy0=;
        b=Tmzh80pHc5h7KLr3qYaAlZFPqj6FBx5o3sAsKD/RJsC0npc7eqOmTmSNlq5RV0iNQI
         dppcFaTBCkS8azhyvfanyuvWTyUxzkh9i6ACtVwoWgAFrsI36OSpV4QdxFlmtVUFM2Ix
         hSMNPUC499JrKZg128MZEcjwSsZg14u7rVALwVC3mWe94DSZKfCDlIv55CAUE4HIu9tr
         ReRooktyjv+R3zHH8e8EwvZn8UTYuodCw8tZOBMcc2a1uDCvKf1sVGUYwcBz0zaY5vor
         2fPy3uL2FC0PMHanhpxMxSlGAqvpPzaIgc3qDD1VWUvGs2m8uFPYh8sTVUYnAhHoB6tR
         n5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701447062; x=1702051862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C7gV2bTYZ/8fGxngk+WgJOxqZzJsxGLjpBfcpof/uy0=;
        b=MNObTtZmy1HqcnAuSH2cPk9fraTGWva7LABu9iVxej2McHsLWFMaFtKmd4OHDFVL4z
         g4Sxe4q7TaJDOYBt+b6cUCxqDSVotmIj6DKQZKkaJECPHQB11RnqYqcbH4FAkaxt8ORU
         JsizYRHeGTZifzmsxQ7AGYXQcGR/DVp7yN1giSuwPiCXeHMq+rNRb0ULg8IsY0ScyZvH
         Gg+tKhU9fWvZ5OFk0ZXXpBHnZI/FG3IR+3oEB9/EaHvq2ZgD8JOpSfmV3P8LC9H4s3hb
         OZ0WhSChlYkfUZNhoDXmoGpf+R4XRGEeH2kVbCABUz0JjfnAtjQ7AnTaPh811D4QhL+i
         UzlA==
X-Gm-Message-State: AOJu0YxR1xG8unLux7QYl315TMVjlUE8ykRW3XO2KPOUEumD5J34Q96z
	z8M6uUvUUAiE0A/jCACRB+wVlg==
X-Google-Smtp-Source: AGHT+IHifnPnjwfFbRUDi0Dq/CXTdTB+43Bv53XwrhOqE0a/iXWMk5yDdxyInhmCzVvC0YTegqDPjQ==
X-Received: by 2002:a5d:63cb:0:b0:332:eaa7:56b0 with SMTP id c11-20020a5d63cb000000b00332eaa756b0mr1048507wrw.14.1701447062005;
        Fri, 01 Dec 2023 08:11:02 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id cg16-20020a5d5cd0000000b003332656cd73sm3907386wrb.105.2023.12.01.08.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 08:11:01 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v5 09/20] dt-bindings: serial: samsung: Make samsung,uart-fifosize required property
Date: Fri,  1 Dec 2023 16:09:14 +0000
Message-ID: <20231201160925.3136868-10-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231201160925.3136868-1-peter.griffin@linaro.org>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Specifying samsung,uart-fifosize in both DT and driver static data is error
prone and relies on driver probe order and dt aliases to be correct.

Additionally on many Exynos platforms these are (USI) universal serial
interfaces which can be uart, spi or i2c, so it can change per board.

For google,gs101-uart and exynosautov9-uart make samsung,uart-fifosize a
required property. For these platforms fifosize now *only* comes from DT.

It is hoped other Exynos platforms will also switch over time.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/serial/samsung_uart.yaml       | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index ccc3626779d9..65d5d361e8f4 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -133,6 +133,16 @@ allOf:
             - const: uart
             - const: clk_uart_baud0
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - google,gs101-uart
+    then:
+      required:
+        - samsung,uart-fifosize
+
 unevaluatedProperties: false
 
 examples:
-- 
2.43.0.rc2.451.g8631bc7472-goog


