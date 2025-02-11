Return-Path: <linux-watchdog+bounces-2911-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A73FEA31111
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 Feb 2025 17:18:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 305C9168FE1
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 Feb 2025 16:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3112505C8;
	Tue, 11 Feb 2025 16:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AillAHVK"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA1726BDAB;
	Tue, 11 Feb 2025 16:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739290587; cv=none; b=qX8hkekmJCGZN4d8FLax2fkhvjwifHhD7g4Kx2yyatSbVBNElfcoIKa0rkDAKgSf7RNNcGl6A0pZyxzfWMA6jKefyIyHhVVjkZ7zsbX8BD20bvuo+QSKs69/aoAPaK33hox3wbqrOC32XP7bsCBY98Z1thUt6PRKioxdI6yR6rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739290587; c=relaxed/simple;
	bh=//cJhE+O0+VrZAKb9m1IxqZPBCUXNhLVk6/ZmK0d5wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YWNT4Uppq7XSn4/f6dqCqQAc27i0ZmucRkPvfrQ+Se9DqyXMOVG99tC4MWUxJNSQiR0+hO7N1RpxpqPGqujlBIA7Sau4ZRQs19u3Ug45IsmatfFZRDN/y34tM7RKDR+mzBNfN90K6XDkn8lpQy1sEvjuqUEDPK/VDxUa/C666eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AillAHVK; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f7f03d856so53172525ad.1;
        Tue, 11 Feb 2025 08:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739290584; x=1739895384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B6NtcHO/GCHrAKEKneWNcs/P7+2+54GmkdtMXWshNCQ=;
        b=AillAHVKZXclNS4/GIngZ9YJfFwdMUzFMepTjD1J7s92bN61LdIARoX8ZTWvD1VecJ
         CUCxxxulGOYpz36kaz5COfqilAGMCRoGaEeu1dOX7E5hp0qwEVGxjoNe0slQw9lrwfJV
         JtOkaPkbTOmVjAlkuZAhUUSnIJcpm8D6YEiqUEzWldfdOFRvIw+A6yzeKjU1htPFQsxf
         8D/0EpNX8klXCX37c9VqluFrUxv0a3Dw61fdvDnAv/dhRKIIgHuNaB2Hc3e/2kGzxpuh
         J7mwYl/Hr5QP7P6yGmJw3A1QFKoDMfRE4SyWJHcqNN657KRwpqaRi9NoycIjrebB/by+
         nJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739290584; x=1739895384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B6NtcHO/GCHrAKEKneWNcs/P7+2+54GmkdtMXWshNCQ=;
        b=uKqc2/OcAlCHsQhzRii+sUpxNTXKernIqL0XIVm0G3/NpF7FIzCH/EaFTpr9FR1rz6
         kBoZs0ZPLKDmOVHdYL4brkE1s25mlBUBUWE6C10nk5MWUqErmF00+bdZ0/pFquJUB9XF
         WTUZBBSJC1kjuWWqvsxwgvyKdLSA/vlyUrXgwX18syRR8AF9NZk8EWOnX6x0PIXznuC1
         l2WzDzqp159t/kKZLjAZUY97C0nAI2pel0P8jIZoiRLW57kFfnCgO5HQlMo/QaeX9YTb
         s9s174/gbNeJ1cc6PvLRJGCB/VHDrfLc/fv54+7HkIB/lxs5useAEnaEUdpmdOoLOnaZ
         1sSA==
X-Forwarded-Encrypted: i=1; AJvYcCVLFBr2mbXcaEKjwo1DRAxQdlfUqUpf0iy6pucmlges6+y5ERJZhrmLL3sS37k+NiYIYbq/N9NJLJLta7g=@vger.kernel.org, AJvYcCXhS6fGg5O7/+Mq3dM8DIOKYuXDYCXPKXEY9kddznPYdGmnH7ayPe6jjmiQNB0Xb1tvp87Xrkux1kh9lyeCWfU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN8iH4hQfQh7xiEdkjgYX6rOcwkLcne+xQf72SK3AQr1s1Pp+4
	2luzpufvrbrPDMV7/1vztCdf7dd9I6jf0bwFerNvLgnD8JOCUL7s
X-Gm-Gg: ASbGncv2LQl0tv6rz2LII3TyoKsqOJpNAYln7yN7jz/KF3MyGE79y8zhuzAZR30YUh1
	X5eP4oOpZAFXCy5c+KWlrJq5xvUyYzDKoOr5JiesoUhSm4JOsRkthXPmkuZ8J/nRlqTqnIo1Fgp
	KJ1x7PGFxRdwiIUpBqT+4LgPqkj1lRNFwHcp1+KzwWhxP3EJELJhc48WUvtoIEUJQKK4m01DJt8
	rKCFlDtPsDyseD5ktsQHKGBA/m521AF2O6FxBTNTcgk/JO9FGYmkTrJ99B+YfAXwS7WQyhX+Dmk
	IPcKivbi8JwArXoAARlpeJHWSI5q
X-Google-Smtp-Source: AGHT+IEDZUvlbfAF77TKsx3UZFWFWMiWRuU/S3EmcSxFxIjzpmOfQbRctCxc8o2e+P083H+VxXedXA==
X-Received: by 2002:a17:902:ce06:b0:20c:6399:d637 with SMTP id d9443c01a7336-21f4e78de85mr361209085ad.40.1739290584543;
        Tue, 11 Feb 2025 08:16:24 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687e675sm98109695ad.179.2025.02.11.08.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 08:16:23 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 11 Feb 2025 08:16:22 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Nam Cao <namcao@linutronix.de>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 23/31] watchdog: Switch to use hrtimer_setup()
Message-ID: <882031d8-5b8b-455c-9f5e-90090408304e@roeck-us.net>
References: <cover.1738746821.git.namcao@linutronix.de>
 <a5c62f2b5e1ea1cf4d32f37bc2d21a8eeab2f875.1738746821.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5c62f2b5e1ea1cf4d32f37bc2d21a8eeab2f875.1738746821.git.namcao@linutronix.de>

On Wed, Feb 05, 2025 at 11:39:07AM +0100, Nam Cao wrote:
> hrtimer_setup() takes the callback function pointer as argument and
> initializes the timer completely.
> 
> Replace hrtimer_init() and the open coded initialization of
> hrtimer::function with the new setup mechanism.
> 
> Patch was created by using Coccinelle.
> 
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: linux-watchdog@vger.kernel.org
> ---

Change log missing. I am also personally not a friend of changing
multiple drivers in a single patch for changes like this. That makes
it all but impossible to revert one of the driver changes if it was
wrong without reverting everything.

Guenter

>  drivers/watchdog/softdog.c                     | 8 +++-----
>  drivers/watchdog/watchdog_dev.c                | 4 ++--
>  drivers/watchdog/watchdog_hrtimer_pretimeout.c | 4 ++--
>  kernel/watchdog.c                              | 3 +--
>  4 files changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/watchdog/softdog.c b/drivers/watchdog/softdog.c
> index 7a1096265f18..0820e35ad2e3 100644
> --- a/drivers/watchdog/softdog.c
> +++ b/drivers/watchdog/softdog.c
> @@ -187,14 +187,12 @@ static int __init softdog_init(void)
>  	watchdog_set_nowayout(&softdog_dev, nowayout);
>  	watchdog_stop_on_reboot(&softdog_dev);
>  
> -	hrtimer_init(&softdog_ticktock, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> -	softdog_ticktock.function = softdog_fire;
> +	hrtimer_setup(&softdog_ticktock, softdog_fire, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>  
>  	if (IS_ENABLED(CONFIG_SOFT_WATCHDOG_PRETIMEOUT)) {
>  		softdog_info.options |= WDIOF_PRETIMEOUT;
> -		hrtimer_init(&softdog_preticktock, CLOCK_MONOTONIC,
> -			     HRTIMER_MODE_REL);
> -		softdog_preticktock.function = softdog_pretimeout;
> +		hrtimer_setup(&softdog_preticktock, softdog_pretimeout, CLOCK_MONOTONIC,
> +			      HRTIMER_MODE_REL);
>  	}
>  
>  	if (soft_active_on_boot)
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 19698d87dc57..8369fd94fc1a 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -1051,8 +1051,8 @@ static int watchdog_cdev_register(struct watchdog_device *wdd)
>  	}
>  
>  	kthread_init_work(&wd_data->work, watchdog_ping_work);
> -	hrtimer_init(&wd_data->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
> -	wd_data->timer.function = watchdog_timer_expired;
> +	hrtimer_setup(&wd_data->timer, watchdog_timer_expired, CLOCK_MONOTONIC,
> +		      HRTIMER_MODE_REL_HARD);
>  	watchdog_hrtimer_pretimeout_init(wdd);
>  
>  	if (wdd->id == 0) {
> diff --git a/drivers/watchdog/watchdog_hrtimer_pretimeout.c b/drivers/watchdog/watchdog_hrtimer_pretimeout.c
> index 940b53718a91..fbc7eecd8b20 100644
> --- a/drivers/watchdog/watchdog_hrtimer_pretimeout.c
> +++ b/drivers/watchdog/watchdog_hrtimer_pretimeout.c
> @@ -23,8 +23,8 @@ void watchdog_hrtimer_pretimeout_init(struct watchdog_device *wdd)
>  {
>  	struct watchdog_core_data *wd_data = wdd->wd_data;
>  
> -	hrtimer_init(&wd_data->pretimeout_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> -	wd_data->pretimeout_timer.function = watchdog_hrtimer_pretimeout;
> +	hrtimer_setup(&wd_data->pretimeout_timer, watchdog_hrtimer_pretimeout, CLOCK_MONOTONIC,
> +		      HRTIMER_MODE_REL);
>  }
>  
>  void watchdog_hrtimer_pretimeout_start(struct watchdog_device *wdd)
> diff --git a/kernel/watchdog.c b/kernel/watchdog.c
> index b2da7de39d06..6a98dbc931ac 100644
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -797,8 +797,7 @@ static void watchdog_enable(unsigned int cpu)
>  	 * Start the timer first to prevent the hardlockup watchdog triggering
>  	 * before the timer has a chance to fire.
>  	 */
> -	hrtimer_init(hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
> -	hrtimer->function = watchdog_timer_fn;
> +	hrtimer_setup(hrtimer, watchdog_timer_fn, CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
>  	hrtimer_start(hrtimer, ns_to_ktime(sample_period),
>  		      HRTIMER_MODE_REL_PINNED_HARD);
>  
> -- 
> 2.39.5
> 
> 

