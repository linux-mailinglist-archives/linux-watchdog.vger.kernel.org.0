Return-Path: <linux-watchdog+bounces-184-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDFA80B7C1
	for <lists+linux-watchdog@lfdr.de>; Sun, 10 Dec 2023 00:32:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D044EB20AE4
	for <lists+linux-watchdog@lfdr.de>; Sat,  9 Dec 2023 23:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8874320DDE;
	Sat,  9 Dec 2023 23:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="km5V7j/Q"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78ABD1710
	for <linux-watchdog@vger.kernel.org>; Sat,  9 Dec 2023 15:31:24 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40c3ceded81so9276935e9.1
        for <linux-watchdog@vger.kernel.org>; Sat, 09 Dec 2023 15:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702164683; x=1702769483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLTmFy+aGpsyLwOEhYkWRbjPeTt0aEpPpmb55d4OE4E=;
        b=km5V7j/Q9oJ0v38UsJLrwcbkBRo1D8m7DlWjiuHoTPqpuQY5yYv1xBLgcratFJqpy6
         ZxtmRrjaDt/0IrwOaRAhoT+W4sTynMCwM0QsgC80Yi8lsfLarnNVzR/yRuNW9LteQGiS
         i+xwTYjSjL5ZTflGoBpvjiv8MfiCCaEmXK32hFV6hsLkHbwswI3kqJgy/fs63YAkQDzo
         7Vys7OGArvJsOW7EUIfbnVGxEvBeHbiWi8MJo2l7Ml98foi+Ni/bdWMjQ2oZBJOF/0L+
         e8+8ZtZYPL/snXHxtNBhWsF/kj9VGY55aXvaNLjslRcPjVeNFiWF7WrF8DK07JWUZ9K/
         F/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702164683; x=1702769483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OLTmFy+aGpsyLwOEhYkWRbjPeTt0aEpPpmb55d4OE4E=;
        b=IYvIUXJRIU3mqIx8uxuxeOR7SAXpL95UvwBWe031pNVIEz27JhXPJwQq3/AwG4/SNO
         SRSPg+dz+Wy0r5I60YRh5BJgOg6WatqS9h+7NVBTT4NBjNbWCwbONYNEj6cD41veWsbK
         Qd2WV3ea0R7UWJMSKflYGbx6sQ9oj5zpD4fHezUBslUKPbF4VukklNuT2ytPhZ1NNjWT
         c9BGCyHJmUw58Ejy5KlxyCysgpCSB7RzAHn3FUrAvedgSxNuRR2fOcdal520h4bABpsp
         5dwmUZXyaYvIUGRsRxgQ/DBr6vVUfjipjFI7CQOr6ISIKsqAbwdKrLm84AAFrA5cOPWC
         3uvg==
X-Gm-Message-State: AOJu0YyPNbwP0Hs5fKoNoQkmjAbgpP5i69SXNxhMtH2MiJ9GjEg4M+EL
	/RE3UQu4PRGQuAKjcckYcuBmTQ==
X-Google-Smtp-Source: AGHT+IHZzuf9nj8AkteP8DCv0mhXpSmMS1+a+kuhBxEPUJQvoaaHh9qKEIYtsLnxuemYPnpFsZAh+Q==
X-Received: by 2002:a05:600c:1913:b0:40b:5e21:ec16 with SMTP id j19-20020a05600c191300b0040b5e21ec16mr1031961wmq.72.1702164682864;
        Sat, 09 Dec 2023 15:31:22 -0800 (PST)
Received: from gpeter-l.lan (host-92-23-61-173.as13285.net. [92.23.61.173])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c4f8900b0040c41846923sm1875277wmq.26.2023.12.09.15.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:31:22 -0800 (PST)
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
Subject: [PATCH v6 06/20] dt-bindings: pinctrl: samsung: add google,gs101-pinctrl compatible
Date: Sat,  9 Dec 2023 23:30:52 +0000
Message-ID: <20231209233106.147416-7-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231209233106.147416-1-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the "google,gs101-pinctrl" compatible to the dt-schema bindings
documentation.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 9f04a0c76403..118549c25976 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -35,6 +35,7 @@ properties:
 
   compatible:
     enum:
+      - google,gs101-pinctrl
       - samsung,s3c2412-pinctrl
       - samsung,s3c2416-pinctrl
       - samsung,s3c2440-pinctrl
-- 
2.43.0.472.g3155946c3a-goog


