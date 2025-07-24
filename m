Return-Path: <linux-watchdog+bounces-3903-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB4CB10163
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Jul 2025 09:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A72641893C25
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Jul 2025 07:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5C03226D14;
	Thu, 24 Jul 2025 07:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uMw1sUWg"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B295226D03
	for <linux-watchdog@vger.kernel.org>; Thu, 24 Jul 2025 07:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753341264; cv=none; b=qzMGHFPhdZjLQzq+wjeSLhFSdyI9EJwD3YCwKeOhko42odwf/CdoL0VB3LZKTxKp0StGfMDjrEPOwB8Nxj0uEuZ6I6zNhqxviTABuHgj3xu3Zfjd+dKtrtZ8znB/TFE8DNJrbkets1PTPrp9jXsVK7QL+pm2QIWOn0T8C21tKqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753341264; c=relaxed/simple;
	bh=rE5qWWZjndiq49hxBlZf+jiV7j0uDbdzOEQLJLes2Yo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B9X8HLAF2s8M1jeSFk0sbLZGBO07yfpAIVRXMtqh+eLDz8LYSvIA7oUFmSm0bRSxGMPe6pfPVzQ0IrypRcT1Ml/r12j25zNcQEOlYnIenvcWVV0lsf1c0pkGcOFWiH5FZaYSnmKXHlrd09fIyhUm2rBrdl44wxDKJD2oBKKcTu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uMw1sUWg; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e7d9d480e6cso422406276.2
        for <linux-watchdog@vger.kernel.org>; Thu, 24 Jul 2025 00:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753341262; x=1753946062; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYtiTl2/vcB5JjeNMht3FQUGQbOf7Sw/0g0qYc0qYCs=;
        b=uMw1sUWgd/kyEaVHyO0gCQsjPlh8i4zKQIw7iR1q+McYVsnggcp0xEcI4LcZHxerIg
         J6Dqhxb83bm3fBqU53lfOuvQrsG3cev/82p61m8rG7GxK3wQruIPEcbauLdU9MS7G3wV
         nxOLADZhnvMJx2QY2gcXZ857x9Y9QG1BJWLYnVkQTtz/oZFEdbOy7fvQlgRZ/q1I2ubD
         ER3jW2pedmhsaXP+NUUOvkKF+FBeIChp4nEDp/8jWB/xM6w2abcRBPiuf733sdTDfjDy
         54Wk1AT6nEmmxNLng9yuZK7HjSmAWouIYXSAqVvCRT+XPkRhMH3+psFrJibni2F378Mo
         CJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753341262; x=1753946062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYtiTl2/vcB5JjeNMht3FQUGQbOf7Sw/0g0qYc0qYCs=;
        b=hQujXbsyiOwpI+aPe2DJyzAYhaHlmyHnM/f2jIp7czIembYk50gKlzvOelziLRwo/f
         z5zLbihxJNXEX7rRvGW4EzFWHjV8TcFRmnvb4QICwjbELpqwH64naQ7f8jH/XPR3kB7P
         dUvgVOLnHWFPbernlXuuKDAk7jvJPOrWDetQh6ItBo7GNvQ/iH0GRQcST2hx5OyWNm0f
         niPUq2HM9gOGG50Ue+zVwfD3BITNRYFFr3UZ1MamQ5w27DCGjKGC3YuuqhGedVmeBA3j
         zRSobyioMFXsFvpjaKR4K6ofYWk0LEPOobaeBiWZnQsRXtnzQAI6RVeUWDccOBb6UQc0
         CGiA==
X-Forwarded-Encrypted: i=1; AJvYcCWJqbv4kHwbxJ9YaYLQ4Nvo+lV65/TfxSmvL4I2kEKANzo5iRhKgNTkrpdATrd7kC/94uWd1BLL9vXo09fi2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUa7BLXxqy98bc/zgbht3Md1r0iQ/ZdlvzS4xxVpQNSW1QVK7n
	XdYjvZXD2leL0evlwj8asWRCxewKWWKVW/8xGc/ITkuZPxmvcyXOhZ6uluaE9OhV3uZSy5ItArT
	UzrU2PhDWqmzcr233os9wRnQ1Ln5ragkxYpshxq9gJQ==
X-Gm-Gg: ASbGncs3xiw7syjCj79qNrw+WkIxuF14DzRXLENfso4RjFTJDKOeQsYkk+a0FqfrDqP
	T5JzDg3gZ6PbGElUKt2TiMev9W/Lbd9D5fNYXHO6VNBkkGxn0tA9ZvcfeywiD3KegZ7/jHfKPL+
	Flm77ihdmFRkEitD3XVOVFLaLMXzYIPmSV+WOw9JWnWMRjE0cKqszs2QdX9uErPewzmw58eHWpH
	FJ52G8=
X-Google-Smtp-Source: AGHT+IFmnBw44RVqEQy61JKuL0iFrYaWpRDyxUhMmlPDwRzFw5AwUBOybBBoOUdWV5mpQDmcfwgotc7Tx/G30sPFLxE=
X-Received: by 2002:a05:6902:4a0c:b0:e8b:d37b:86fa with SMTP id
 3f1490d57ef6-e8dc5a86969mr7074336276.37.1753341261694; Thu, 24 Jul 2025
 00:14:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250714055853epcas2p1c8a30bbc61045c6a359d32989cfaf2f9@epcas2p1.samsung.com>
 <20250714055440.3138135-1-sw617.shin@samsung.com> <20250714055440.3138135-2-sw617.shin@samsung.com>
In-Reply-To: <20250714055440.3138135-2-sw617.shin@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 24 Jul 2025 02:14:10 -0500
X-Gm-Features: Ac12FXyeh_teX33m6-oCCNN--bnf0arq8tqlpYQ5bLEOmvlZqoOtQ8w9OKWGEX4
Message-ID: <CAPLW+4=Gsd9VNv6T_e2QMWkPNbjp4c2GQEYpD9icU3r+0QuPww@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 1/5] watchdog: s3c2410_wdt: Replace hardcoded
 values with macro definitions
To: Sangwook Shin <sw617.shin@samsung.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 12:59=E2=80=AFAM Sangwook Shin <sw617.shin@samsung.=
com> wrote:
>
> Modify the code to utilize macro-defined values instead of hardcoded
> values. The value 0x100 in the s3c2410wdt_set_heartbeat function represen=
ts
> S3C2410_WTCON_PRESCALE_MAX + 1, but it is hardcoded, making its meaning
> difficult to understand and reducing code readability.
>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/watchdog/s3c2410_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 40901bdac426..95f7207e390a 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -587,7 +587,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_d=
evice *wdd,
>         if (count >=3D 0x10000) {
>                 divisor =3D DIV_ROUND_UP(count, 0xffff);
>
> -               if (divisor > 0x100) {
> +               if (divisor > S3C2410_WTCON_PRESCALE_MAX + 1) {
>                         dev_err(wdt->dev, "timeout %d too big\n", timeout=
);
>                         return -EINVAL;
>                 }
> --
> 2.25.1
>
>

