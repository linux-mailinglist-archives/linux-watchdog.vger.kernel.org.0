Return-Path: <linux-watchdog+bounces-2093-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA769910F7
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 22:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EA721C22DC2
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 20:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACBBE7406D;
	Fri,  4 Oct 2024 20:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFTMSt79"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BF7231CAE;
	Fri,  4 Oct 2024 20:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728075281; cv=none; b=WrQBRUmdIVxpqWzfIbtoHWrCo9LML+XamLhxoagnkado+M0YUW9EiEVym2qtcMKF2+FvIEYwfoZQs53llTMaFRZc0YLVjl8nAvD5khSQL8oUqPrjlX6QuDl62QZZBVY6Tth1TwwF2LkMaLhaf7GtNMrQVik8iAewbNeByQpcegE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728075281; c=relaxed/simple;
	bh=0nebFgyXysSWDWnQZVoWEALxoJeAoHkstpZ4Oe2HoRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=InGybHNeKPYcHhs0T59wooj4ynuO4xuHGYqYGtA0acUbYadLx7DIrU81eP2cyWIgFETEvzGsYYdkUl5UWJiqtg2Sa6EpMVwsEt+uyM5AYzksidGUW2xUAUWd3eyrBBdq8/LiYmAPdOoA+822cEuGjcB5NZ4/iCdWiCibOx4tSoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFTMSt79; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7179069d029so2000126b3a.2;
        Fri, 04 Oct 2024 13:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728075279; x=1728680079; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ir91wjsLu7qjjjD9nb3lbz+LANF3mGuM0dYeVvk3fRQ=;
        b=iFTMSt794PAuKMj+5r17iEpRsqZVAIrjcrsLdnCQGFwHly/xQg3xa/nrdYgIFEzM3c
         2pbF7lG0hXrK0R5upHYuKHx2EV6TrrrSrpqDXb1JEPoI/pQ1qFIPPNGbNguGse17QiBM
         WiOlqKrgoanvBNBrh87N0wKXwZxXvmbNJTHdDirLNDnJ4jPbPa5KC35lHXx/MhPhyda3
         c6OH1dUZsLt04L4V5k2SLWQJLMmkLMUmumGMCsRz3gz1Awo5aLVBLZNV4HaIQ1IPjDMk
         IVVLkKDfUtxfeqguhrL/29Wi4i8zrUEVYpPDsDfquG2S8P5ZBsrwvq6BcC76wA3xzgY/
         nXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728075279; x=1728680079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ir91wjsLu7qjjjD9nb3lbz+LANF3mGuM0dYeVvk3fRQ=;
        b=cMGzNBBSkYdiHHWvFyoRfLHiBhf8QxG+RujnqwNa0m/SYq4LcEgynkMom9rsWOURyr
         GSIOx1AAgxyWK3pjG06y+PvSkz8M0sFVjep5QUoERDdXVxTluZ5GPtZJitVFlHhe5sh6
         PMRT2tanGfeSe5mw/8PhQcBDtMSyD1WWcnkEFZgqrtEDzoMj3N2tESQoU5IT1ptNhjgd
         BuL2B+dUTTkIgj0hExSjwdhnSRA3HWLyMEYrSJb9yenGmAhPqAgTruxWH1bYRJkBCihO
         ay6IHKKIU9ZQBxCmgpizH18Ve6Nx78OqBuhhPevSXZ250HWVAd8SOCulZtcFpLqaYBrX
         hF/A==
X-Forwarded-Encrypted: i=1; AJvYcCU1Hx+Tr6qoudHU7+hlLE7GD1sD7f6cGnXSeV689DZl4TQl93pZrL+SiI/4Toro0WQaXpT7gTxFT2jC3cUqpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTwMAwkOgQIrsZRg19wcz1iGoD6b0ckiSa9o9WmTtBCA3mZDsT
	0AiM7qJbk1+EGRaVSJ0fODIZ/nXIBOKC0DsoV7l2NRh5cEkX83Qf
X-Google-Smtp-Source: AGHT+IHbZWrl7mpdijr4HGdvUMdhPH2M2ryd4sOGONkOGCXNivoONyvbUbmJrfiPNfIA9wJmyJlR7A==
X-Received: by 2002:a05:6a21:3992:b0:1d3:2928:f167 with SMTP id adf61e73a8af0-1d6dfaeee76mr6352120637.42.1728075279394;
        Fri, 04 Oct 2024 13:54:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e9f682d374sm356987a12.44.2024.10.04.13.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 13:54:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 4 Oct 2024 13:54:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Michael Walle <mwalle@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: Re: [RFC PATCH 9/9] watchdog: sl28cpld_wdt: don't print out if
 registering watchdog fails
Message-ID: <1ad2caf1-fffa-4feb-9f67-0ebbea0ace0e@roeck-us.net>
References: <20241004200314.5459-1-wsa+renesas@sang-engineering.com>
 <20241004200314.5459-10-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004200314.5459-10-wsa+renesas@sang-engineering.com>

On Fri, Oct 04, 2024 at 10:03:12PM +0200, Wolfram Sang wrote:
> The core will do this already.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


