Return-Path: <linux-watchdog+bounces-721-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DB18629F9
	for <lists+linux-watchdog@lfdr.de>; Sun, 25 Feb 2024 11:41:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56AE71F21637
	for <lists+linux-watchdog@lfdr.de>; Sun, 25 Feb 2024 10:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A153F9EA;
	Sun, 25 Feb 2024 10:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZEh82UWB"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82B7ECE
	for <linux-watchdog@vger.kernel.org>; Sun, 25 Feb 2024 10:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708857674; cv=none; b=Xmgo4dzhIjcy3gmaaX6NDCCdG8086KYnLomhNR9YIVujhW5LHFelSjScTvt+vaU1lf3epV76fk6omuo2UnYAFJy//G6dVq7O7SCeUG1voWtrPEJQkBPN/PVh78sbOynIy4kXTzlsGIAEOH0nZVgRUYXi2i97ngUqtSx5it33cYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708857674; c=relaxed/simple;
	bh=NGal5+MdkZJ9C3oskpMyNkT2juojJFy1GB1Qlne+lSc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PAZZnRVt+o0r6WPjbFFyuBl5YVz3Mp1NmU+s4XF64EQKS2DyewTQPFOy+2iG2fMrrv8kKO3iOEUW/65O6c1snQtzFid7W97ZgM92ZDGhXuIXk32JFW5ExbMOTZj+ORVSj0MeChhubJgrJhU0Mp51gt5LRb+Ix9v4W5j6mswrlhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZEh82UWB; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-55a5e7fa471so2875923a12.1
        for <linux-watchdog@vger.kernel.org>; Sun, 25 Feb 2024 02:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708857671; x=1709462471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B90C9a+WfcdZ8uM2WJXyBInhj0u29PGuBSq6RYKhYho=;
        b=ZEh82UWBrxsVG1m+fzRAf03N+ZlhIknAyhz14Jf4W+LA5Kldd3xC1ebSmthhsr0GIh
         GlgZ+IDpcHn1NFpIDtkfK9iOpK27p5MwpEO3VB6S7I4hUzg0BG+U+BonS0FoSsg4TIpn
         kP5S5ZOySQ3o1ASZJCQQsxQw9BsT1sWwDXvkS0/A6MyGpMdqQ7ju0CP26v655vrzVPz8
         xTYBIKxlHJbWVy9AE+vAyCIAIivjw553GZQP+ONgzxvSxafkwMSfWJx6nULNI/nLtXjW
         izJb5KIvWQ0jcABXDv5pz6ZLHgISXTcLpyIAwL2FhfZLHJsC/tQ2QCh/+fkwOBg2/WdN
         AcUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708857671; x=1709462471;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B90C9a+WfcdZ8uM2WJXyBInhj0u29PGuBSq6RYKhYho=;
        b=kDfkEKZKD/tPwXYHFCHizCLljP0GVnSWERYddaWyAWWKp1tx6tg0kRHeGykG1ZwmmQ
         TKhREWUAFKvv/+F9dtzK930UmN+Xgqex64dIbonBlYzDXZJ/6CDaUD5Kh9oxb3tDu/W1
         /uFxXwlsz+rhsUsd2lMdF/sGTIxI8TL2CyOMx5sjjNywQT70YgZYz0w/5rc0Z64LhLQ8
         3cjEMGNxrnruuuCofqXhcptK+7U7R+oFJpCSmSXPAqDCpoKvAupJZk6YtlltKByrOLQ+
         FxXAhatPCAzAd9jE9DDUUInQwOgFn7TLCcnSQUvGOjEBPDrajqjWZ9NRpTJoo6mNiZ6S
         Upaw==
X-Forwarded-Encrypted: i=1; AJvYcCWzg6a8RqnFf+BfE34NIjNgJlm1YcgZWBP/QoqJr2zpdgBP8adQghMkNXxnndzrnG9w3l0VGqANXnJ/TsRtfSZdAxU6+OjHHUmL0L6b2pE=
X-Gm-Message-State: AOJu0YzLDWq5xEM2tRENu5yWFp7U9J2IPu5lvROx9IfLazjttmlAjbOK
	n2Pa/DHVDK12mki83V6U6+pCrV6rsFvCvFtsQlk98EwqGFdNCUdxtzZpBIBWjwe07G3rXk8SXpK
	U
X-Google-Smtp-Source: AGHT+IEmq8dI9JznOlbF1C026b4TbJ/75cqqVPJXzSYWBO58n6TQzO37aFC6uRbi2MgCIHwoyIucVg==
X-Received: by 2002:a05:6402:1a5b:b0:565:7114:ef37 with SMTP id bf27-20020a0564021a5b00b005657114ef37mr3384537edb.12.1708857671158;
        Sun, 25 Feb 2024 02:41:11 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id v30-20020a50d59e000000b005656816d622sm1397547edi.11.2024.02.25.02.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 02:41:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: arnd@arndb.de, linux@roeck-us.net, wim@linux-watchdog.org, 
 alim.akhtar@samsung.com, jaewon02.kim@samsung.com, 
 semen.protsenko@linaro.org, Peter Griffin <peter.griffin@linaro.org>
Cc: alexey.klimov@linaro.org, kernel-team@android.com, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
 willmcvicker@google.com, linux-fsd@tesla.com, 
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
In-Reply-To: <20240220220613.797068-1-peter.griffin@linaro.org>
References: <20240220220613.797068-1-peter.griffin@linaro.org>
Subject: Re: [PATCH v6 0/2] Add regmap support to exynos-pmu for protected
 PMU regs
Message-Id: <170885766906.10417.17172064962783512739.b4-ty@linaro.org>
Date: Sun, 25 Feb 2024 11:41:09 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Tue, 20 Feb 2024 22:06:11 +0000, Peter Griffin wrote:
> This is a v6 of the series to add support for protected PMU registers found
> on gs101 and derivative SoCs. In v2 and later it was re-worked to be based
> on a regmap abstraction that I think leads to a much neater overall
> solution.
> 
> The advantage of the regmap abstraction is that most leaf drivers that
> read/write PMU registers need minimal changes.
> 
> [...]

Applied, thanks!

[1/2] soc: samsung: exynos-pmu: Add regmap support for SoCs that protect PMU regs
      https://git.kernel.org/krzk/linux/c/0b7c6075022ccff529318597dc6b165dd6a25c8f
[2/2] watchdog: s3c2410_wdt: use exynos_get_pmu_regmap_by_phandle() for PMU regs
      https://git.kernel.org/krzk/linux/c/746f0770f916e6c48e422d6a34e67eae16707f0e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


