Return-Path: <linux-watchdog+bounces-3137-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AA0A70192
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Mar 2025 14:26:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3024B173801
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Mar 2025 13:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CCAF2571A8;
	Tue, 25 Mar 2025 13:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKJza+rO"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D976D1C27;
	Tue, 25 Mar 2025 13:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742907955; cv=none; b=uQO9WcXy1WDKJXM/tt+CSumhb38wCvvQg20KsZDu+qlJfRRBZJcvMbuQaff0+dQr7ufHdT96R3S+P2uWmB0x5RhjTCFgB2f8B2HaddGG5tE1wcGUU+/LVEdUdI2T8qgPXU/WqHpiZKRo4PI9lEVHnU6oY62Dj6EYjmnmEK4gCcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742907955; c=relaxed/simple;
	bh=ZvyhGtvPxkuId73PTLC7kZbLoWzURbstu3mktaIomPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XnhN36jdHt/mxO3pLfTIv1ywPZCedCxtVYJOKVV3Agu/kPEYsKfu6iECRZwRN4l53z11M0kNgnTvl29jjelGLrDcVopPnQTlwsJP8e18tRz8Wxt7Ta4T4YntB5La4nEKLaZ9bFedgE0CdnReDOFZK2cEBfloFcQRN/KdMadCfJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eKJza+rO; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-224341bbc1dso104990755ad.3;
        Tue, 25 Mar 2025 06:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742907951; x=1743512751; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BzUjfplXlaMzm08GhwwPjKcb60ffCUVxu7XRbKYwS04=;
        b=eKJza+rO0QNDtP4CkMy/nidegz7aiQ2aXc8qC0QFOCDDXePw5GSMRJH1v/ct+Ykp2E
         9QJoXGMdEjvaxHgTFdIiSa46M77jAgcB8pQVxIYtk/KWThiuT80/+qkzJzZezKpn1/Kv
         Hts5NhwyiRL2ffRGAZxifNPeX6jXL7MsVI3Z9zx+9afe0JxkQf8l4wp6iIIREzVMD1ih
         /mS/7/tEesVDOi1NtaT3TfqlBs6Vp0XI9RGYFxHWkGyJi+vJ1Hvv3jj6gYo96zD4kdxV
         c3zDKwFfm4uBIMLpeQ92ZGTV7dJN/Wg+nNy6MHeM+YbKmTCHAQ7SOYicqK3h0erqqsW+
         jwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742907951; x=1743512751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BzUjfplXlaMzm08GhwwPjKcb60ffCUVxu7XRbKYwS04=;
        b=bj2g4B1mXFTN6RhLN35F96AUKyUWJsZb9JzVhmQCQIRVdc7eQdTtjyfQ928s01XS5/
         iz3YTfpZCZNBiA5Bsw1XH6R6/B0IIrAumDIz3Z2r37DpO5HpvHl3rCC+ZKZrQmUnR7Ja
         unAUTC08Db+a+9AEDHFYo7heI9AhkoGFEWcj0yAFfiglAiY0AB9p8bxW9L03V/ydPyax
         yNkKJZaQ9gWrF2Z+7XFVwUoCzy+c1W6/bGwl2v+HYexleSO4k1EyPOPa5zLQK5eYz0vj
         Iybv/+sAFNrP6WJ+m+8/DOz6SVkZJJ0kbumvF5vv6cMyNSjpI1YLIYij2DSIv4hJmm3/
         BJVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJTOwP5ownirdXU83rUnA8YS+nWKeJxIPqDZf8pMN47osET4x7WqO11Hwqw5Y6B8ELeyDIbirRmtsAUQSTv1Q=@vger.kernel.org, AJvYcCX3SCw7OUyE+8qpnbiDOJlDfEhm6LskwLmmTEwLPAjnGH9JV5plgaN+PyftoqTz1v+vfNPaH2zZ2vKKtIs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVB1Ywh6zcnunIEy47yCueZB1NvghJH2OvponpiliYgRuGkB8h
	xfOY7G+o/NcaagTsizJfvtbLPkNAeWoX/X19uqEB5k6XS85Rsu8bgx3DCg==
X-Gm-Gg: ASbGncu+A78XAPWVJYBFkI184RPm5/Tko84bZZXyRiHr/yoF7U/uUdAfhlLCnUPvEWR
	UGe7XwjPL0wpmRPKG28yW+DGJSFlcaIdjPZL2L2X+fQKkTvKfHwqW5KA/SJ9zME/M1ZIj5/tBtP
	M/jT+KEW0qLs5zCZpRn/rzEgZpDAL68iDEMQoAR7h6myJlATOihn4Icq+jzDn1A2a2N2G16L6qH
	Hh1PtSKJt+kKHgV4LUlJGCk/Oin16TS75XIG+6zOaMt2LoJBEOpPKifTWFXDDb2WFO34zZFCUfr
	6O3qtR7Z/CFcmTaMsgfcBVpLxI0vx7zHzmLb22p538lWXJyZ0OhEFaNcl073hZAVaj/h
X-Google-Smtp-Source: AGHT+IEJnIkCmTcB8Dkd4EICafHlGONd/fP4z5sTuQFKVeGNSTLuRYSGTEWw11a3XIiNtTd0pwr9dg==
X-Received: by 2002:a05:6a00:1485:b0:736:51a6:78b1 with SMTP id d2e1a72fcca58-739059bfdb8mr27725802b3a.11.1742907950707;
        Tue, 25 Mar 2025 06:05:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390600bad4sm9987793b3a.77.2025.03.25.06.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 06:05:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 25 Mar 2025 06:05:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] watchdog: da9052_wdt: respect TWDMIN
Message-ID: <259a249a-6fa8-41b6-8654-1be773c91224@roeck-us.net>
References: <20250325-da9052-fixes-v2-0-bfac3f07b4a4@gmail.com>
 <20250325-da9052-fixes-v2-4-bfac3f07b4a4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325-da9052-fixes-v2-4-bfac3f07b4a4@gmail.com>

On Tue, Mar 25, 2025 at 08:27:15AM +0100, Marcus Folkesson wrote:
> We have to wait at least the minimium time for the watchdog window
> (TWDMIN) before writings to the wdt register after the
> watchdog is activated.
> Otherwise the chip will assert TWD_ERROR and power down to reset mode.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/da9052_wdt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/da9052_wdt.c b/drivers/watchdog/da9052_wdt.c
> index b821006fca70480bf3b23a62bded4e66851a537e..1e49cbae7eaec3015264dec891032a56f56e36cc 100644
> --- a/drivers/watchdog/da9052_wdt.c
> +++ b/drivers/watchdog/da9052_wdt.c
> @@ -179,6 +179,7 @@ static int da9052_wdt_probe(struct platform_device *pdev)
>  	da9052_wdt = &driver_data->wdt;
>  
>  	da9052_wdt->timeout = DA9052_DEF_TIMEOUT;
> +	da9052_wdt->min_hw_heartbeat_ms = DA9052_TWDMIN;
>  	da9052_wdt->info = &da9052_wdt_info;
>  	da9052_wdt->ops = &da9052_wdt_ops;
>  	da9052_wdt->parent = dev;
> 
> -- 
> 2.48.1
> 
> 

