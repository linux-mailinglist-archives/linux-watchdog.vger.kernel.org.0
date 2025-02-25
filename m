Return-Path: <linux-watchdog+bounces-3008-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A13A44575
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Feb 2025 17:07:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1AC51883B95
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Feb 2025 16:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78EFC18E03A;
	Tue, 25 Feb 2025 16:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+lbSHnu"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6E818B475;
	Tue, 25 Feb 2025 16:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740499489; cv=none; b=PUosQCV4DTTDJlFoU3mPOCAjR28epcdE6+2tkMitdtDWEDNEwJD0+ABPs/anfZQjzK9tDi1Rb6a/6o/Ml7+4fny/aarDNf7D2CIQeDpXoIIFagrXsuq6RVsYN2raOfkr40RlOfCDp1xJcXV62o0cDPFbBnyu9XTAaSTFGvEAzTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740499489; c=relaxed/simple;
	bh=Cssv3O9deygNopTJWPD44unAzs/rt53XfRmlY8D0JAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fiddOpLo+HvNzRomLEWGIas1dhKWPGHqzRSDjsMNegY43ArHqeVL+DEom3LbO3qMldMvnlfEMUevXR0m+AGldWLzp7yWN7QzXTFRvCVniHVmErv0Qbfc83MX90yaKrCcf42qlYKEvOlg+BQ0aYiBsrwGshrjOqvLZNxwERJEdaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+lbSHnu; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-220e6028214so127566285ad.0;
        Tue, 25 Feb 2025 08:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740499487; x=1741104287; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nfC4yU0nUtrxnIRRLUVwOoOOnizoCUAoie4Fblmw1ow=;
        b=B+lbSHnu2Zx726ASecpXlGVGi91RA0xFm0h72ehzihvkXYlsH04pquuGNKNtXJyJPK
         8nEsy17YWP21NAbN+IBS+CF2zspoWaTWoFRsh+xiMnchiu8xqW0BynyhJsFaEjTO3SzG
         ajRaI5SwxXVlfUQZ9Jnn0Nghvem/efnYCTltLgOCsoEZoszy9ttAgg6iA0THLdb5+RvU
         VSJVL0lM4UfsJLmMydHSOOPWAiovQ/oKv3EKduQ948BX/GSW7AMobrfln15Q0Fzy9+8k
         LVk6v04otSvDRBJ6YUUrA0DaCnLqy4dLcKwvv6VF4dhg9fkpuDAzgKm3TO3QsgiNO8GL
         2IGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740499487; x=1741104287;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nfC4yU0nUtrxnIRRLUVwOoOOnizoCUAoie4Fblmw1ow=;
        b=rFNewLTprhvnw1xytnfK3GDcD/LKbPYNx16oW+JrCKJ5FTvtClEbqbNvI4aXQhu7k+
         Dv5zDX+Od6IWGqROG+DfyOCiWUacIQH7Cl4hgMUxtCsgx+dAdTwwfF+YVLN2YAI0Jr8S
         /bUKgJn/EAlFJaaYvQbEVzl2/1Vb+uhiTPj+3n+O2snbP9DjMYpWe+NycnB9HpYrOCfz
         N0Tuj856d6fIzRgN9gwQDVS6NLL7V4X27l8c7S/35nNbGTREjdz5B8mIQvOSPa9ZDRvB
         sOIBhc6D64VFGOqva7JhFugQbjgLDJJWBkIKUiWPVcSVt3QjZN33dHe+VVIv/4kgpzcr
         8/Ug==
X-Forwarded-Encrypted: i=1; AJvYcCU03wQZe+ZfweZmfPoCE9q9xq2iN00/HbQ7035u8BZGa4l4iicxJV3BxXkIGejQzTPQlpIdMrtCCStKusaOCQs=@vger.kernel.org, AJvYcCUQq8UoKF3JupCkJMbWcpRlqgoOW/udC8qXYNpgx1yXqdHa2h/zfG1A05cZn1PzxABMZixsCMfyOX+4c+z2@vger.kernel.org, AJvYcCWo4cHK4lH2r5Fnr4lGGF28aosQwVMwDSDmQeRbXMARSHTHBIvG4phXQhXXM9ik905r0NVo9PnLPDA=@vger.kernel.org
X-Gm-Message-State: AOJu0YybK+JPRyCBW5ZKPpxQLtR+SjRZVEOqQAqEAd+EXdmocGK9LS5Y
	E7GYusMuIJ+iubL6kOdl4LVOGU3hSEh2YPTmaPj6bm1QU456abiffwziTw==
X-Gm-Gg: ASbGncsHhW/r7dw6Dwwkc64xjiTBQ6LN5+HurDS2MJyBf+JEdtBIT85HULIZ6/lGZ2f
	eAN0OTWb0qdw0Ja3G3GQuxAie4UORo5zh/5BXCrFIXwdGsHZWZiV9hfCR+Z4XkdRFdN1OVQJGRC
	7eX/zXr+vv4L9jNBktYc20Wv/zJozwiiSZk1f/mlgNpSHmNfVVMpIzvomaeYlcWzsrAoKf+QL6O
	7d0hK/+KCl87giW0Zv5mQUPymFOiy0DMMXjg9mIBS8i7ZKv6K85VLfTGdwbs/HkGlvArIj1hi0H
	wJTJh4J19XNNY+LTtuGeYfui8oUemQXuf5Y/c1E=
X-Google-Smtp-Source: AGHT+IGkE+gW8A5hUQrZyr2X9IDG8DRjjSSNdNAFCdIreEChLZj609zabpm5mLXa8Bqxjvjfv4DSmA==
X-Received: by 2002:a17:902:e74c:b0:220:cd13:d0ec with SMTP id d9443c01a7336-221a00274d7mr287259265ad.48.1740499486466;
        Tue, 25 Feb 2025 08:04:46 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a0ad903sm15922925ad.217.2025.02.25.08.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 08:04:46 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 25 Feb 2025 08:04:44 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: George Cherian <george.cherian@marvell.com>
Cc: wim@linux-watchdog.org, corbet@lwn.net, linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drivers: watchdog: Add support for panic notifier
 callback
Message-ID: <85d99af3-a3ee-41dc-96df-0b9903a6f516@roeck-us.net>
References: <20250225140615.2141119-1-george.cherian@marvell.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225140615.2141119-1-george.cherian@marvell.com>

On Tue, Feb 25, 2025 at 02:06:15PM +0000, George Cherian wrote:
> Watchdog is not turned off in kernel panic situation.
> In certain systems this might prevent the successful loading
> of kdump kernel. The kdump kernel might hit a watchdog reset
> while it is booting.
> 
> To avoid such scenarios add a panic notifier call back function
> which can stop the watchdog. This provision can be enabled by
> passing watchdog.stop_on_panic=1 via kernel command-line parameter.
> 
> Signed-off-by: George Cherian <george.cherian@marvell.com>
> ---
> Changelog:
> v1 -> v2
> - Remove the per driver flag setting option
> - Take the parameter via kernel command-line parameter to watchdog_core.
> 
> v2 -> v3
> - Remove the helper function watchdog_stop_on_panic() from watchdog.h.
> - There are no users for this. 
> 
>  drivers/watchdog/watchdog_core.c | 42 ++++++++++++++++++++++++++++++++
>  include/linux/watchdog.h         |  2 ++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
> index d46d8c8c01f2..8cbebe38b7dd 100644
> --- a/drivers/watchdog/watchdog_core.c
> +++ b/drivers/watchdog/watchdog_core.c
> @@ -34,6 +34,7 @@
>  #include <linux/idr.h>		/* For ida_* macros */
>  #include <linux/err.h>		/* For IS_ERR macros */
>  #include <linux/of.h>		/* For of_get_timeout_sec */
> +#include <linux/panic_notifier.h> /* For panic handler */
>  #include <linux/suspend.h>
>  
>  #include "watchdog_core.h"	/* For watchdog_dev_register/... */
> @@ -47,6 +48,9 @@ static int stop_on_reboot = -1;
>  module_param(stop_on_reboot, int, 0444);
>  MODULE_PARM_DESC(stop_on_reboot, "Stop watchdogs on reboot (0=keep watching, 1=stop)");
>  
> +static int stop_on_panic = -1;
> +module_param(stop_on_panic, int, 0444);

This can now be bool.

> +MODULE_PARM_DESC(stop_on_panic, "Stop watchdogs on panic (0=keep watching, 1=stop)");
>  /*
>   * Deferred Registration infrastructure.
>   *
> @@ -155,6 +159,23 @@ int watchdog_init_timeout(struct watchdog_device *wdd,
>  }
>  EXPORT_SYMBOL_GPL(watchdog_init_timeout);
>  
> +static int watchdog_panic_notify(struct notifier_block *nb,
> +				 unsigned long action, void *data)
> +{
> +	struct watchdog_device *wdd;
> +
> +	wdd = container_of(nb, struct watchdog_device, panic_nb);
> +	if (watchdog_active(wdd)) {
> +		int ret;
> +
> +		ret = wdd->ops->stop(wdd);
> +		if (ret)
> +			return NOTIFY_BAD;
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
>  static int watchdog_reboot_notifier(struct notifier_block *nb,
>  				    unsigned long code, void *data)
>  {
> @@ -299,6 +320,14 @@ static int ___watchdog_register_device(struct watchdog_device *wdd)
>  			clear_bit(WDOG_STOP_ON_REBOOT, &wdd->status);
>  	}
>  
> +	/* Module parameter to force watchdog policy on panic. */
> +	if (stop_on_panic != -1) {
> +		if (stop_on_panic &&  !test_bit(WDOG_NO_WAY_OUT, &wdd->status))
> +			set_bit(WDOG_STOP_ON_PANIC, &wdd->status);
> +		else
> +			clear_bit(WDOG_STOP_ON_PANIC, &wdd->status);
> +	}
> +

No longer needed here. See below.

>  	if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status)) {
>  		if (!wdd->ops->stop)
>  			pr_warn("watchdog%d: stop_on_reboot not supported\n", wdd->id);
> @@ -334,6 +363,16 @@ static int ___watchdog_register_device(struct watchdog_device *wdd)
>  				wdd->id, ret);
>  	}
>  
> +	if (test_bit(WDOG_STOP_ON_PANIC, &wdd->status)) {
> +		if (!wdd->ops->stop) {
> +			pr_warn("watchdog%d: stop_on_panic not supported\n", wdd->id);
> +		} else {
> +			wdd->panic_nb.notifier_call = watchdog_panic_notify;
> +			atomic_notifier_chain_register(&panic_notifier_list,
> +						       &wdd->panic_nb);
> +		}
> +	}

Simplify to
	if (stop_on_panic) {
		if (!wdd->ops->stop) {
			pr_warn("watchdog%d: stop_on_panic not supported\n", wdd->id);
		} else {
			wdd->panic_nb.notifier_call = watchdog_panic_notify;
			atomic_notifier_chain_register(&panic_notifier_list,
						       &wdd->panic_nb);
			set_bit(WDOG_STOP_ON_PANIC, &wdd->status);
		}
	}

This also fixes the bug where the unregistration function is called
even if the notifier was not actually registered.

One thing I just realized is that we'll have to figure out if atomic
notifiers can be used here unconditionally. Unless I am missing
something, watchdog stop functions can sleep. Of course, sleeping
while panic isn't a good idea. That means we _may_ need a driver
flag indicating either that the stop function can sleep or that it
won't. If we need that, I suggest we add WDIOF_STOP_MAYSLEEP or
similar to the watchdog_info options field.

Thanks,
Guenter

