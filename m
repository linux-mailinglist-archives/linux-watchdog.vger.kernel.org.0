Return-Path: <linux-watchdog+bounces-3446-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7DBAAD854
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 May 2025 09:38:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52B6C4E2C00
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 May 2025 07:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9316F2144CF;
	Wed,  7 May 2025 07:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OXPQi0Os"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADDD171A1
	for <linux-watchdog@vger.kernel.org>; Wed,  7 May 2025 07:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603486; cv=none; b=ibVffdPtRL7pbT0aSA+EFmBd3A7Z3jsDkym1dutcBy+n5o5HluNd1nnEq9OGgEgGL4e9WWbeQWXFwSkp44GC2sxcvy/8ZlZZb+9fpYDlRhb1QYzCkzLpYzPdzZcOuyz/iIJif015JtcI051/vHQYwE21PQ9U1IK75uQ6jmeCEoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603486; c=relaxed/simple;
	bh=7npp6hPVQ4yM/96OUj34mNQnuigGDI/MdlJq9LMAeSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SRsIvqtv1zkzT3hHoldzX0LQ/rCANYIoBDmV3RZ1APutFNZfbTO2zTN3boQsosKEWO+GFk0A4Ladx8ISOxH+ktoN6+uhky/YbY1oJAw/njeVXFIKCVwa6ECURWTjCx2gKrNgayiQRrGwGLw7hsaYuDfNfBwHhEBKwItA/Tx6+es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OXPQi0Os; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a0af41faa5so783888f8f.2
        for <linux-watchdog@vger.kernel.org>; Wed, 07 May 2025 00:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746603483; x=1747208283; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ku1Cd6liaJS1iLKgaFG0kdzf7HtFlMcgCf1BXc7L4Dk=;
        b=OXPQi0Os+ZfrAqN/E9Klo3GQjvwLQuTZDzVb8EI3I4uSZj7J1SPKTL0JYDbkHbUC42
         l/r/L8V3RLkyV8JaCp7uZ8KSW4a5VKXGUiOEJXIT/gYjgukikaULnOkQqzvdKxesF5+l
         w76eHPB9yS3NsfF7DD1pIU4fmWNNH/f7u01zswWsycSspOplD8tlRzSqqeP1RSQoQeJr
         NjpVAFMgp+Nn2fK8U2pe+lrctQ4E/E57uIAtTO/Qb30FiCwBqVTU/nuW7e4i4i+aSBmG
         awLV94yjBEPS8IcL4nKTAnlrhkTifkLn2AGOawWv1Gxbmd5t897KsN+a/XhVITLAAaK4
         WmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746603483; x=1747208283;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ku1Cd6liaJS1iLKgaFG0kdzf7HtFlMcgCf1BXc7L4Dk=;
        b=mwBctJFaGl2A8g5hTn9U+TbEpoiH2azIRJxzFakyRcRXQ70NQfSzJM4BGajDUaC1um
         oLNo3H1oXSuQPtDorP1gHGWFBmOjgbAflqX4kvbfTXUNZtAyB/pFmfcHQbjBFUq/RBtz
         q2AVOZ1wEHSQ6cGPnfrpf4kbEfXipGA+A1jVK8A4UVGtF00mv++fuyfJ9o3hiCZj8GSC
         FsQTFP8V3qmBwW6STREe0hTxOgp4U8w5/cSYgYFz7Hbqo7c9YCz0cfg9G5CfK4YltDqq
         vAbkqz+lNUDkLTyofxJ/cSomvufqD+grnv0+c0+kxF0KO3oIbiJEGzPOdQm7jw7XOOib
         GcPw==
X-Forwarded-Encrypted: i=1; AJvYcCW6s1R1uG/8sgKT4ox8DUr2YdC89TbvCoFVD5DarfetzS2fosZYcoYpiSNz4v9AKngoq/sWhjSFBz67bVhZsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzZBLRxmeVVw96vaa1JYqj0cWMl54sRyRInFDvZYVDqgYx3eNR
	9zhDlLJPmlL0jA6x0CPXqjYij8ZpYHiluy7RhYrcPXiq1f3eSCzQ9b7MESg6slc=
X-Gm-Gg: ASbGnctQfgwwP/icvzC1n+i/yyJc8iF/lgVB0TmIrRn3d1nmiKg/auRF2tvvVVgEYPe
	OrTPYdZ5/sXwMgmXd0Qw29+ifoyc7KpJoJlQTgNV8y3ijquFVeJ7O5yZ1WJmJ8l+Wv5Wq2QaziD
	joB63gheXsb3NFTNv4OsB8eYnrKCv539trYPAn7P6Z1qKwvcXlyP7gB39vC9xtc71tZrokQM5LD
	k6IqdUZCj31a3R6+GSbw1L4aMtmCSknifLY9TREmsgoDIR9kmpuBVa3pb2HbRnuNmWCSTRmnANy
	s+2jZgMnbOsfxD99ux+tpXiSvxqd2VCqkUf7engTigscVzf2y6sy2K5enhfwWZEo3Oqp2Dp7D8h
	LsKI=
X-Google-Smtp-Source: AGHT+IH2OGqrTp/OeMgPGxQlZfnrGAyad5LXS0wg/MdZb7u/oyAnw+kFBdwrxcGQe3PnVxyYJ6CP0w==
X-Received: by 2002:a05:6000:1448:b0:3a0:b733:f255 with SMTP id ffacd0b85a97d-3a0b733f3d8mr119641f8f.25.1746603482927;
        Wed, 07 May 2025 00:38:02 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0bb5sm15753969f8f.7.2025.05.07.00.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 00:38:02 -0700 (PDT)
Date: Wed, 7 May 2025 09:38:00 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Robert Lin <robelin@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
	pohsuns@nvidia.com, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, sumitg@nvidia.com,
	linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
	linux@roeck-us.net
Subject: Re: [PATCH v8 0/3] clocksource: fix Tegra234 SoC Watchdog Timer.
Message-ID: <aBsN2Lvx476ZO6Lv@mai.linaro.org>
References: <20250507044311.3751033-1-robelin@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250507044311.3751033-1-robelin@nvidia.com>

On Wed, May 07, 2025 at 12:43:08PM +0800, Robert Lin wrote:
> From: robelin <robelin@nvidia.com>
> 
> This set of patches includes a fix for watchdog for it may not bark
> due to self-pinging and adds WDIOC_GETTIMELEFT support.
> 
> --
> V8:
> - Change WARN_ON() to WARN_ON_ONCE() to not spew too many message
> - Use pre-exist DIV_ROUND_CLOSEST_ULL for the same math operation
> 
> V7:
> - Fix formatting
> - Consider overflow and warn if happens
> 
> V6:
> - Fix timeleft value addition using unmatched time unit
> - Use u64 type to maintain the microseconds value in case of overflow
> 
> V5:
> - Print warning message if get unexpected value from the register
> 
> V4:
> - Improve the precision of timeleft value
> - Fix the unused variable warning
> 
> V3:
> - Improve comment description
> - Refactor to fit codeline within 80 columns
> - Remove unused if(0) blocks
> 
> 
> V2:
> - Fix a compilation error, a warning and updates copyright
> --

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

