Return-Path: <linux-watchdog+bounces-251-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF78E80D182
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Dec 2023 17:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F078B21517
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Dec 2023 16:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF0A4E615;
	Mon, 11 Dec 2023 16:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nGHbcFT6"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45BD2B4
	for <linux-watchdog@vger.kernel.org>; Mon, 11 Dec 2023 08:24:40 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-33628562b88so548531f8f.1
        for <linux-watchdog@vger.kernel.org>; Mon, 11 Dec 2023 08:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702311878; x=1702916678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n0Lj2p0v1sl5yq86/3/9+bEkk8+V18FXO5bRu94y79I=;
        b=nGHbcFT6lg0K0s/PFutPuG75NBLFQkOtGfSiAksPOOjZhMtytmTNGqfDNNeVZfWzLc
         oGfe7mKGPA2oLZmwQAP9+oezqbb/25E3tWN9k3nQk6shR/71KjVGdvUb+1Nlxe68e6Jp
         i9THOoDVb03zOSd1VxsrnzsHJRDnCsve2JW11inwvT/QlBw4juF2PNQjMqeu4ZZdRNE4
         5Jfzn6PdPjWi2EAK2NMcSvxVSQWA55p2XI/O0BvlMNqVfZ0wwLqcc0L2dGo7FHgAluap
         JwK2h2mk7n3ZWuhssA8+t1Rt33ul1MlT9yAHY6HeJ7OVImxXAIupa+5mETXbBk9OZmkN
         yFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702311878; x=1702916678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n0Lj2p0v1sl5yq86/3/9+bEkk8+V18FXO5bRu94y79I=;
        b=T1TLe6OKzQjjABH/ajKtEWvMxDp08h7928EYADJLnHfSKJDzXLxNOJ9Dj6s20LBwUZ
         5QjQLfDHY8jpmrCUZe+3WZOXXh2+d0/jSFNXEft749lQx8YXb2Chg5K2ucuv09S/oo0V
         WwwFs6bf0v4bS6ooau+wbMiZWSd2oSPgglg7/uttyi8RKqx/EgsVXd8myg5+xJcZMCk7
         IYXLze6DtQplV1v7Awmpr2D4WcCTTv2GURGRXEckYLnd/RXfyfr7rt77z6g7/7PQdfuW
         JX+6OSrH2P0al9coQtfR/y9kKVar2fcp6a9WrQGRg0Wvqs88j1282/dleF4z7f9BwrzK
         Uj4w==
X-Gm-Message-State: AOJu0YxiAA2AbalevZhjFGkRaVX+UQ0Fp8ZUrDfGEV0hr1NZOTWtPJLL
	RxBpPyfbp+iWIm7qwqDM3MUniQ==
X-Google-Smtp-Source: AGHT+IEJ1wyxwuNA3PXmuuz2u4iY6o6+Ee5/vHbf2Ow+1e6WSS6WhSW8nRIGDlzcwK4PBfpljzk9Yw==
X-Received: by 2002:adf:eed2:0:b0:333:295f:1039 with SMTP id a18-20020adfeed2000000b00333295f1039mr2795311wrp.43.1702311878601;
        Mon, 11 Dec 2023 08:24:38 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-28-58.as13285.net. [92.29.28.58])
        by smtp.gmail.com with ESMTPSA id o4-20020a5d58c4000000b0033333bee379sm8923103wrf.107.2023.12.11.08.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 08:24:38 -0800 (PST)
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
Subject: [PATCH v7 16/16] MAINTAINERS: add entry for Google Tensor SoC
Date: Mon, 11 Dec 2023 16:23:31 +0000
Message-ID: <20231211162331.435900-17-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231211162331.435900-1-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add maintainers entry for the Google tensor SoC based
platforms.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 98f7dd0499f1..b731d6b9876a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8990,6 +8990,16 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
 F:	drivers/firmware/google/
 
+GOOGLE TENSOR SoC SUPPORT
+M:	Peter Griffin <peter.griffin@linaro.org>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+F:	arch/arm64/boot/dts/exynos/google/
+F:	drivers/clk/samsung/clk-gs101.c
+F:	include/dt-bindings/clock/google,clk-gs101.h
+
 GPD POCKET FAN DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.43.0.472.g3155946c3a-goog


