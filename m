Return-Path: <linux-watchdog+bounces-3948-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD90BB18AA0
	for <lists+linux-watchdog@lfdr.de>; Sat,  2 Aug 2025 06:12:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8FA4564B00
	for <lists+linux-watchdog@lfdr.de>; Sat,  2 Aug 2025 04:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BD391547D2;
	Sat,  2 Aug 2025 04:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CIjig7F3"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F38615C158
	for <linux-watchdog@vger.kernel.org>; Sat,  2 Aug 2025 04:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754107918; cv=none; b=cxSh9KPpVtUgzz98iMMypMc6k4gNSIkuebI/6DHtZdWvotzrP+/b25yLFU+S8CPUQLfo0WfGUfRVQPbZJ7qZEAxgez4U5dbEtVxUTDcCmZ3CiMNAlZWTFOKA7qiSmbvmrNQ7QQpvDMQSJxSgkUj+ioAQWnzruGvgEwbyLM8C38s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754107918; c=relaxed/simple;
	bh=lJKRnlysUD8MFDQfZoBVJQlFexCUCMcqAdy6vCaSzxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gfLpDeANmV9TO0dh37eUw5m9cjxNBK/ptxtYrnvqs7/sGShLGursvlOsL18Oi87I0BBrTu4DP40CSXT5Kroeu67K/2pAqFheuUkPB8uedcZSFmBXlzHGpQlNNcMXzwDb47ctx0k9Kcqdu5YIqS1W54ZJvbezu17T6eMJsadK6fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CIjig7F3; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-719f5a141a3so22925717b3.1
        for <linux-watchdog@vger.kernel.org>; Fri, 01 Aug 2025 21:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754107915; x=1754712715; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYp4mXKhOVGUhhKWIugNhHcZ1ORze3B3p0bRipFlplY=;
        b=CIjig7F3Dtlq4c5T9Ikl2c2bBjh6pJaMFyU+KImT8R2vXxu34MDFVmw9wZ0/V4qpgV
         Uw4hAbe7w4SGCG5w3XEoJo1qHPr/u8VIj6/XyU/wWKcEJ2lCReYU7/7yn7bH7S0SzQIz
         Y66CQ0YgDhaei344hRUh0FtFrp9g1MK0ufbWaDkdYJSBgk239J+HisOFE8Cqxv5/pHe5
         YlZupAbzCtloL+4MszhCNYWt9yGI+QeVE9eK5PNMYkvhcplJQuobx1kupvBBiiZByPTp
         hiY2xkV4d66md1913w4SxnRB1rqQXYSSPb8+4r3l07hHTXOWyH5sEafxZeinu/WKCBLB
         IlAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754107915; x=1754712715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NYp4mXKhOVGUhhKWIugNhHcZ1ORze3B3p0bRipFlplY=;
        b=JMx6zb8g5hxsTbp/ag5cnfKV8PPYt280/h2em8MEEbGOLnJjDMNXLMDGpcni3z7cv9
         9U3RHzS49AFGR77DeUP4hgTG0VXolUTmgVwYuX4S2rGr/BRzM9wECzaKcn6tQ8cIJiJO
         vbigGQMYZ7ZLDXiZVDuWOV+TTRVXYPugfpkw9v98ufffP07htApaUPy0jKJxh4ZlxkK7
         4orp6B9y1EfODEo8VsyUdW0kk7hBU5Gg+JbJbhVaFEiO0Ebuejn9mCQRLvrrAiaJR2cl
         n6I6Rn2Q2FyP7ktNOq0KanhcvwsSEAxfnLkl7OJe5fQVzf3FdGkPWtq+8bJtR4AlX3mm
         WbJA==
X-Forwarded-Encrypted: i=1; AJvYcCVoA3RJ9h5lqRoWAETrk5vW91+xVOapa5k/nxOcl44QlO8ylv4L9zoTpk4uwY5cMElhCypnaVvW67QXF3h+xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPlKlt9TA5db+d9j6TqpCtn7BtUGn3SsSertJW31+s8aCnyAgf
	rC60Tzj1bIceRNiGau5qSpB4cyQXVupUvH0x81GVaTdQ9Ykvnil4z0+ZHfoUAmFmg2XTSMWUOqb
	ufO+xJzija5SjpXNAc4cWHFjd4nj1EJgGXqHr1uDAlA==
X-Gm-Gg: ASbGncvJqWk9+AhKzWOJuEx0+j9Nza5TmZU5pMwEFm2kE411ycpDB1EsAKRWHPc45Zg
	+1oNASpr+NSmfCU2EpVBLG0FqDcKmKE93w17KEYu5tTTJiAkKDAHgeWVQQhXE3URN3xACrSxAN9
	NK/GQ9icPHDJDkEeK7UWFyPtBgMJqsjEOve4n8vJ0cVSG/qtIFEq0V2EqQLojOtEoYwwDUJiE0X
	DndWw==
X-Google-Smtp-Source: AGHT+IF9ctIxKBr9nfRXs2qCE2fyDGDHNm3LJDq8aN0iByZsWyGIn7LQZuF9bXAq3rhtwRAuKAX7NxEh1CJ8dlCDFPo=
X-Received: by 2002:a05:690c:55c8:10b0:71a:20aa:2265 with SMTP id
 00721157ae682-71b5a71c1e8mr83900667b3.6.1754107915222; Fri, 01 Aug 2025
 21:11:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250724081336epcas2p38e95932ddc5c702e05a6436f05582993@epcas2p3.samsung.com>
 <20250724080854.3866566-1-sw617.shin@samsung.com> <20250724080854.3866566-3-sw617.shin@samsung.com>
In-Reply-To: <20250724080854.3866566-3-sw617.shin@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 1 Aug 2025 23:11:44 -0500
X-Gm-Features: Ac12FXy2WLL3xRYhDsxothu9WYIfOUZEaNDjOS1ze6he7jduUVYVbSmd09OsrAk
Message-ID: <CAPLW+4nRh9DEnkhunG68xvGdaNJswC8fN4v4uBA1Aaao_5pxfw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
To: Sangwook Shin <sw617.shin@samsung.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, khwan.seo@samsung.com, dongil01.park@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 3:13=E2=80=AFAM Sangwook Shin <sw617.shin@samsung.c=
om> wrote:
>
> Fix the issue of max_timeout being calculated larger than actual value.
> The calculation result of freq / (S3C2410_WTCON_PRESCALE_MAX + 1) /
> S3C2410_WTCON_MAXDIV is smaller than the actual value because the remaind=
er
> is discarded during the calculation process. This leads to a larger
> calculated value for max_timeout compared to the actual settable value.
> A ceiling operation is applied in the calculation process to resolve this=
.
>
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
> ---
>  drivers/watchdog/s3c2410_wdt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 95f7207e390a..31f7e1ec779e 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -411,8 +411,8 @@ static inline unsigned int s3c2410wdt_max_timeout(str=
uct s3c2410_wdt *wdt)
>  {
>         const unsigned long freq =3D s3c2410wdt_get_freq(wdt);
>
> -       return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX=
 + 1)
> -                                      / S3C2410_WTCON_MAXDIV);
> +       return S3C2410_WTCNT_MAXCNT / DIV_ROUND_UP(freq,
> +               (S3C2410_WTCON_PRESCALE_MAX + 1) * S3C2410_WTCON_MAXDIV);
>  }
>

How about something like this instead?

8<--------------------------------------------------------------------->8
static inline unsigned int s3c2410wdt_max_timeout(unsigned long freq)
{
    const u64 div_max =3D (S3C2410_WTCON_PRESCALE_MAX + 1) *
                S3C2410_WTCON_MAXDIV; /* 32768 */
    const u64 n_max =3D S3C2410_WTCNT_MAXCNT * div_max;
    u64 t_max =3D n_max / freq;

    if (t_max > UINT_MAX)
        t_max =3D UINT_MAX;

    return (unsigned int)t_max;
}
8<--------------------------------------------------------------------->8

This implementation's result:
  - is never greater than real timeout, as it loses the decimal part
after integer division in t_max
  - much closer to the real timeout value, as it benefits from very
big n_max in the numerator (this is the main trick here)
  - prepared for using 32-bit max counter value in your next patch, as
it uses u64 type for calculations

For example, at the clock frequency of 33 kHz:
  - real timeout is: 65074.269 sec
  - old function returns: 65535 sec
  - your function returns: 32767 sec
  - the suggested function returns: 65074 sec

I've prepared the test program you can run on your machine to play
with all implementations: [1].

Thanks!

[1] https://gist.github.com/joe-skb7/c2b2290bb0b0572a4018d81fc4ba1f3e

>  static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool ma=
sk)
> --
> 2.25.1
>

