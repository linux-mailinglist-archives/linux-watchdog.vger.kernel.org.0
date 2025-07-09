Return-Path: <linux-watchdog+bounces-3848-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0171AFF3C4
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Jul 2025 23:15:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A0381C83F4D
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Jul 2025 21:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE805241C89;
	Wed,  9 Jul 2025 21:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQJz6jgG"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5E723C4E7;
	Wed,  9 Jul 2025 21:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752095703; cv=none; b=ljSl3gNMvI+P5qCpideEZ8x7CXSPG6u88g8sUQD72c2FLUdK0JKdWvQdW7dbeBY1luQ7NHOnfDg2ibPxhQGGAra2WS7t1mbiKoFcYC78aNiEkjC5UutIFbomOx98kLEEDsYsVb6uWtWNM+rkCW4gmZl30iZP+sKCuHBNlgX/1nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752095703; c=relaxed/simple;
	bh=GCXd/bKtKBALRAe+wzF7kPkeKWNFkiPumnk6aQVRmBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lmch2W3T/g1Jmc4jOvBpF9Eg8lJ9QF/7UdQdlF6FnMLlgEtONmQe/DTwWV623wOntXRira7Hy3zdqymoh30H+MqElZRvbH2qh5D/qku9VKaoR+aOZDi/M20UfEFElQ1Wl4UccwLKszj2ddfAv5dWVYSXaoM/KyPHTpHbaJfUb/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQJz6jgG; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-237e6963f63so2108225ad.2;
        Wed, 09 Jul 2025 14:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752095701; x=1752700501; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KVET3EHlLtoNj9SskcVhzRu9RLHy7NPETg2zqciMpaM=;
        b=UQJz6jgGRO6T1sqbXp7JZHvjTqTU3YYLkx7hGLLMw664XnXxp7oyPZjef3Qv7tr5Z1
         4NcT8eIOqCEZseJqV25W8nLcw2gdaKFzfrFFDmFLB/nsfMWSrXGFhJIyaCZnD5kUjimd
         ZwXchTFu8+c9fBYD4w+mpAde7DvaYnQHZBfJwuZ6FbZwJAKb9HrgvrwMJR0EDSqvDHYx
         pMRnmPam3ioBvpVpD1Drad0rWnp+X4W+Ms/D4UCmmPWt5xi+isTqwf8Z0fJqamaET/+Z
         JX3NqZmgreVkwpwjW88X5YcQsw+egcuuNgjvVKOhwr65qg9AJG2JEiIUdps/j1ii66Sx
         UMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752095701; x=1752700501;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KVET3EHlLtoNj9SskcVhzRu9RLHy7NPETg2zqciMpaM=;
        b=Hjnf38+h15SZwMpbjtTiuWLo/9OPoGAHNksvX3J2WMoSkhWN/eVlHYTlYJO97JlXpu
         RxaAe3o5Y5Z9umnxNuvkInY0HDyVv5TGeY8q2uRH69RxUYmnGSX5Fwpt8jcIzRWG5V/J
         eWCniLLskqd/SUuzVfyKvS4Y689A6MvCSaBQ7TRTu/eNObGQai0YR2IEMaGBsvCHn3tI
         BuXuz51di36eHMhmikDgBvZQoHmQv1dzjd65FyGS84WZ9cOv8Vm5l9oXrmRGg1hjQTOD
         ezyK+kKONMze4mYHl8e1ajiX6Ug6hQL0jculYbQCLCZSnO5WLdJdX+o7nfCx4RKRWB4b
         Zs5g==
X-Forwarded-Encrypted: i=1; AJvYcCUffVa/1UJtKy6hRQUl42a5YPbHsoK/LgsllC4NaAlc4GHBs2Lxn6ba4M8YCMuXUrZ/jaT2eHPqDaMi9Brw2wTZYg==@vger.kernel.org, AJvYcCWwhucJ9KRUFsnjM1XpmItgngUT7en2gxXind5RmRh2J7AK9a4sx4IG0WbA382ZEzheomq0Y5ECwulXrWV7u7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyrUuFnQ42xJYjjsWxqzXWkfLPnpV8cUFAl9BwMNwpeIPxzcd2
	K7chc6rIF6uIRBSGMNG/5x8M1zhvnP5hak8/D2loUoZ3GxsNVwhCnHq5gdxeHg==
X-Gm-Gg: ASbGncu9bm2pixdSB59fv/iUlVZoLcger1FrmnL7rzPLKPM8H6IYtfmc7Zmt2Nx0/JG
	DeyVsNLPK/PKPfX8EAihooJw/3KIHaFYvE+MLnOsuQx5LfZzh4eg6B6Ky+ITPMGcq/OTdFY0wFt
	2WMlz43TUNkxRD5tdA1wCnDZob4mtCh4hXV+6lqocxsAwh1pTjODJVOXs5o06nJiq7kKkyBGG6o
	323E3nsxjU3l3acOA7i+bODnlUoYE+DDZ/Ni+HOMJm4FtrTAPbg2zdPZr/8BbPG++QK+/v2ER6V
	GNMrcw6uFZX3IzaPvgNwEuwbP2PEs84njHcCqZ+gHae24xH/AmbjJuK3MoPmdXQtEYjPzJgdBA8
	=
X-Google-Smtp-Source: AGHT+IEzOwwN50qju2G9iCM+P2BmgfOyzzNgkvLE5t5htvIJBJzHtT1Z9FfxlWgqedLTBB1aOq6csQ==
X-Received: by 2002:a17:902:cf09:b0:237:d486:706a with SMTP id d9443c01a7336-23ddb32b540mr60638295ad.48.1752095700542;
        Wed, 09 Jul 2025 14:15:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4323e36sm990155ad.114.2025.07.09.14.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 14:14:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Jul 2025 14:14:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-watchdog@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] watchdog: renesas_wdt: Convert to
 DEFINE_SIMPLE_DEV_PM_OPS()
Message-ID: <4356f795-1dd8-497e-a32b-ee34291b24d2@roeck-us.net>
References: <3d6d46ff56c908880a167ffb2a74c713060a1a57.1752088043.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d6d46ff56c908880a167ffb2a74c713060a1a57.1752088043.git.geert+renesas@glider.be>

On Wed, Jul 09, 2025 at 09:08:05PM +0200, Geert Uytterhoeven wrote:
> Convert the Renesas WDT watchdog driver from SIMPLE_DEV_PM_OPS() to
> DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().  This lets us drop the
> __maybe_unused annotations from its suspend and resume callbacks, and
> reduces kernel size in case CONFIG_PM or CONFIG_PM_SLEEP is disabled.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/renesas_wdt.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/renesas_wdt.c b/drivers/watchdog/renesas_wdt.c
> index c0b2a9c5250dd721..97bcd32bade52131 100644
> --- a/drivers/watchdog/renesas_wdt.c
> +++ b/drivers/watchdog/renesas_wdt.c
> @@ -300,7 +300,7 @@ static void rwdt_remove(struct platform_device *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  }
>  
> -static int __maybe_unused rwdt_suspend(struct device *dev)
> +static int rwdt_suspend(struct device *dev)
>  {
>  	struct rwdt_priv *priv = dev_get_drvdata(dev);
>  
> @@ -310,7 +310,7 @@ static int __maybe_unused rwdt_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int __maybe_unused rwdt_resume(struct device *dev)
> +static int rwdt_resume(struct device *dev)
>  {
>  	struct rwdt_priv *priv = dev_get_drvdata(dev);
>  
> @@ -320,7 +320,7 @@ static int __maybe_unused rwdt_resume(struct device *dev)
>  	return 0;
>  }
>  
> -static SIMPLE_DEV_PM_OPS(rwdt_pm_ops, rwdt_suspend, rwdt_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(rwdt_pm_ops, rwdt_suspend, rwdt_resume);
>  
>  static const struct of_device_id rwdt_ids[] = {
>  	{ .compatible = "renesas,rcar-gen2-wdt", },
> @@ -334,7 +334,7 @@ static struct platform_driver rwdt_driver = {
>  	.driver = {
>  		.name = "renesas_wdt",
>  		.of_match_table = rwdt_ids,
> -		.pm = &rwdt_pm_ops,
> +		.pm = pm_sleep_ptr(&rwdt_pm_ops),
>  	},
>  	.probe = rwdt_probe,
>  	.remove = rwdt_remove,
> -- 
> 2.43.0
> 

