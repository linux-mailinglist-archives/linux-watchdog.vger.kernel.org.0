Return-Path: <linux-watchdog+bounces-283-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EA380F660
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Dec 2023 20:17:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 476E61C20C19
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Dec 2023 19:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DFB981E40;
	Tue, 12 Dec 2023 19:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OmE+tv7o"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BDE6E4
	for <linux-watchdog@vger.kernel.org>; Tue, 12 Dec 2023 11:17:22 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a1da1017a09so733407466b.3
        for <linux-watchdog@vger.kernel.org>; Tue, 12 Dec 2023 11:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702408641; x=1703013441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q81f6tvuC/62M26cD5+zhpnHZ0bvi1DcQhgd2N8HT8g=;
        b=OmE+tv7olRThtF0Ebt9AUAvFUI6P5OoTQuykjvT9AZS1xN4p7w2nco7R+6zGI4Z1Qy
         UtN94WNEIhYppATJrZohER5xZUTgtYJX138MNHCVO+nvPitoF4opAG6R5s699enphIxj
         4p46qbc0CfigrTyEn9UoD4yJUlXk1UPtbMpzkyOt7leozD+gRJZp0sk5HMc9AoZyXo09
         i0MasLaO1Ls+8O1juy3OZKU10VSyCd+zmTvXZxOTF2BseBI/Qc0xLrlXUD9MF9bMoEAL
         YsD+fp3zqYa5dPd+Jl0F47QKvXpAVqRVG5cuXGtoxaaXcmISZRNotmBSswjJcw2RL3zb
         1kfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702408641; x=1703013441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q81f6tvuC/62M26cD5+zhpnHZ0bvi1DcQhgd2N8HT8g=;
        b=fbhfn4glRUnihfknc5s9Z2+eagWLTbtp2ixkYQCdCxpi9p3ax+Gww6YICQKoUyIGZg
         nLD4N2kgZ7/PbyKo+IPch2589Nl9k00FLnj1VxLJlckqpn1bL+5ccVivSSAfMGRYbRn9
         jzGcMTDZV63k7956RsJVjC0rB9UVq7WljRpwGgDoni+p1slWoCCNjABrqsSGQdfGj2xD
         dOcpUmY6zqzbdtwrqI/FAEslq2FAiZ+AQFG5XDozKYxydhjePbRFKyH6e+Uj/cK08UZw
         X+SAbmZGVGgmkE/St+G8JZQcGdmogJizPV8mI/S9nq1NPIseGD9Kc5AtzTFT2/ddb+mP
         E4dg==
X-Gm-Message-State: AOJu0YzAlfXlezeq2fSX5HIhaN8kjA7Gm5syShegm6AzyjeA0zv+SD8k
	VshVhnsPLwF1M9JePOh85IlF9Q==
X-Google-Smtp-Source: AGHT+IErxwGD3BlZkSUookdNqWVQz7uPq0j3jdF2YUIwZl8jPuzuYHu/C9CZmUM1+hb143ssA3PhaA==
X-Received: by 2002:a17:906:6a19:b0:9d8:78f2:7ea2 with SMTP id qw25-20020a1709066a1900b009d878f27ea2mr4682806ejc.54.1702408640691;
        Tue, 12 Dec 2023 11:17:20 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id sf22-20020a1709078a9600b00982a92a849asm6739126ejc.91.2023.12.12.11.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 11:17:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
	alim.akhtar@samsung.com,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
Subject: Re: (subset) [PATCH v7 09/16] pinctrl: samsung: Add gs101 SoC pinctrl configuration
Date: Tue, 12 Dec 2023 20:17:15 +0100
Message-Id: <170240862865.229534.3131999037082419524.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211162331.435900-10-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org> <20231211162331.435900-10-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 11 Dec 2023 16:23:24 +0000, Peter Griffin wrote:
> Add support for the pin-controller found on the gs101 SoC used in
> Pixel 6 phones.
> 
> 

Applied, thanks!

[09/16] pinctrl: samsung: Add gs101 SoC pinctrl configuration
        https://git.kernel.org/pinctrl/samsung/c/4a8be01a1a7a030ae7b6138602d2e060cf7a0946

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

