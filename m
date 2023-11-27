Return-Path: <linux-watchdog+bounces-46-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D71D27F9B85
	for <lists+linux-watchdog@lfdr.de>; Mon, 27 Nov 2023 09:19:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 924C1280E2F
	for <lists+linux-watchdog@lfdr.de>; Mon, 27 Nov 2023 08:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC5CD11CBE;
	Mon, 27 Nov 2023 08:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hzh2TU5o"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E55A187
	for <linux-watchdog@vger.kernel.org>; Mon, 27 Nov 2023 00:19:04 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-507adc3381cso5306103e87.3
        for <linux-watchdog@vger.kernel.org>; Mon, 27 Nov 2023 00:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701073142; x=1701677942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DatyrqYzt7l09gkz3RwGC/LqPoXrHevVF//yl/kf7UA=;
        b=Hzh2TU5ozKbylr4SU7TyFalocW0TtCwMdUYu+Kjw4+pBJuN9k7xpjTcyg0oazgtrDI
         J+sava6bF/OgRONY+4GFmeiuCDQKQwrhoCOEK0rKgpSiqkwYuwWYIvl8KiQQhcW8Klun
         gG7+8zeAFAM8IMWJCHChNQGODU1KegFWdzP8n0IUvbRLBGiQ5AcZznAvZ9lCI6DVXuoe
         e8JaPdu3+LOO3NM9Dv7fWl4QH2ZziDmGxy1tG67T8vQokeIn1qPmZrdtH1f8+36EqN/B
         fZ27WNsMnecx8TS9N4BLI2NUGgKIHhPyHHgZEZVCMld65hjodNOgX468ldUwhWAFymvd
         OKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701073142; x=1701677942;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DatyrqYzt7l09gkz3RwGC/LqPoXrHevVF//yl/kf7UA=;
        b=Y8G4t8rcvePJiZgdjP+kIuoixxY4np92aG5U+xQ9jw4Pm6BuPeOG7Sdg/T4f4kTC71
         gaJjPyZ8Kh87CoGWWa+pH+Is5xh25kaHPEZeRLBGclccLM2Sj6ButvyAeIBJ5JTCttbv
         idX18QFQOm8FWN+1SZZTAfxYyGje6Leu6PLSCGLKRcfpBe6/vhxMp2nDfp0ZSbUyAO9+
         iUMnkiEN3cPr8rnht1NBWOgZ8pnFXdHdybeDcuT+frYz/cnHiqY5EKhqJMu4uHALLPOB
         9nAh1jXVCdF2WeWwXl4EVwEMd9PavOAiPNr958zRRcZBHfahRtnCrKox55zAhQALZtt9
         AHFQ==
X-Gm-Message-State: AOJu0YysJaNDYyjQo1D3z8CSAIi4qplvahjZRRxhMAWUXike3291ykdT
	kfOqy+po4UPNfw5Avmro7iaMCQ==
X-Google-Smtp-Source: AGHT+IGo5481lkWUQv34iJL0VQEkk+omxRs5PmyZo2My6DNUSZUJm3rCn/6nN4sI8ZpCCdAy1HtiIA==
X-Received: by 2002:a05:6512:3751:b0:509:4c7b:c734 with SMTP id a17-20020a056512375100b005094c7bc734mr5900453lfs.20.1701073142535;
        Mon, 27 Nov 2023 00:19:02 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id be7-20020a05600c1e8700b00405442edc69sm13516568wmb.14.2023.11.27.00.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 00:19:02 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, Huqiang Qin <huqiang.qin@amlogic.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20231027104358.342861-1-huqiang.qin@amlogic.com>
References: <20231027104358.342861-1-huqiang.qin@amlogic.com>
Subject: Re: (subset) [PATCH V3 0/3] Add watchdog support for Amlogic C3
 and S4 SoCs
Message-Id: <170107314169.1083800.14516457377836864819.b4-ty@linaro.org>
Date: Mon, 27 Nov 2023 09:19:01 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3

Hi,

On Fri, 27 Oct 2023 18:43:55 +0800, Huqiang Qin wrote:
> Amlogic C3 and S4 has the same watchdog controller as Amlogic T7.
> 
> Changes since V2 [2]:
> - Modified yaml document to ensure that dtbs_check passes.
> - Added a patch for watchdog support for S4.
> 
> Changes since V1 [1]:
> - Added C3 compatibles, with T7 compatibles list as fallback.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.8/arm64-dt)

[2/3] arm64: dts: Add watchdog node for Amlogic C3 SoCs
      https://git.kernel.org/amlogic/c/a30c7a73b0ad50c40c01811fa23e74764c3ba007
[3/3] arm64: dts: Add watchdog node for Amlogic S4 SoCs
      https://git.kernel.org/amlogic/c/2d66f91208d1174eb8ad29706e8bdfb587a34d5c

These changes has been applied on the intermediate git tree [1].

The v6.8/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


