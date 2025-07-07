Return-Path: <linux-watchdog+bounces-3823-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F140AFB722
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 17:20:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 903857AD685
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 15:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F00A228F94E;
	Mon,  7 Jul 2025 15:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGMLmkC3"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E9E2D9785;
	Mon,  7 Jul 2025 15:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751901624; cv=none; b=Y0l6Xd4YjRBzs/qPxkTOeJrZEmWuqS0qtLMz3sWazMm2yVQFJ+QYBH3JuJWW92+8TOb++j1LjzkwK/9stLLlARbeUD121/95u+bwI3U4hFg03Y6EreQz85vUN0l+qRKMDukhKIPqUZxj5C4IPnAEM84Z4Yvqde9MXMsOxRCInlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751901624; c=relaxed/simple;
	bh=5UEyGDGNHUh6RZqadrlKQCu6X7b9GWVQD6GpVxDY4ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drB5jqLKsClXa9WDtbXDLwsH8ex+bNcRz1coLu2i/Pt75tfyMrDhEefzt8tWcuLjKiexukpawGlXDb6H0tE6NWKHNtxT2QiUDzNdI90OL7xaVgfZncOWpUWp2Ais4qR2vGFcvXVLQsyNcEZu6kzENbgbyjpAtV7vQ47n4wBUSZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGMLmkC3; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b34a8f69862so2569423a12.2;
        Mon, 07 Jul 2025 08:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751901622; x=1752506422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAPqu21NTo8BYyCnSmBn0KSAk3v+gE45TqPe3FODGXc=;
        b=HGMLmkC36XYL5ZEROpmkhJi8eb9tNpoz3GEHx2zeLzUKvwJZjbG9t8nc9bFSUy7oGj
         XvXIIFFBrOfp6y9LU9Y5qgId/AoA45oM+kdc1QoGpNU7nexve324NAFpVN0/v6OSPG1B
         uzLg9VQiK5GGjL+U62L+I2DRHcK58lm4ChLCCX0dLqGO3sMspzSsGBys9ZHEv9vPaSJw
         sw8pm4yORqdsezunfO6WNE9a3JRTJEPdmfWwnx2wwMJYn/XfKULq42hqvR66hZrp0D+1
         neRZKe3cp9SkajeuGl0AIThqSJAzQUGQgAB7esBSC/900zO26nB/OUEqOBn01gkGC/Cn
         lFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751901622; x=1752506422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAPqu21NTo8BYyCnSmBn0KSAk3v+gE45TqPe3FODGXc=;
        b=HfWqBsBLai1hrmc14B6Sm/88ULW/vGUTdjwc0p6FMCop2bOfgN6tjHObzpcjhyq1M1
         euWLd2JYvftQikltbEmGqpqeXDZWBcoAY3U7f0LnISNDqEXqY7YmkAW5jMtjRq+twzlj
         IvevWqVFrujbuYlN7fyNRDRMunu0RCMqOajYq7TA8dabeiy4VhjdTgPwm1ZXYgl2cf0b
         8PNAZ3YakxLfheiYAywKQ6v/bjkt1F9S3pj2gK7B/lao1SJhtgkDnSbhzlKbHs0bpXBb
         /UT9tXQkd9FaDju3e+dmTR1vx/hdb6uDYvW+htAE+kfGmGdaxusqADZUXhyAzq5u4sSA
         ZHCg==
X-Forwarded-Encrypted: i=1; AJvYcCWK0rCPnwdk+jRHXSc5oYIPnPer08Bo6zc6BJnvYZRxgQ9Rz8wee+Sx1hYAAT01S7QyzvQjdaEOs4lVdfg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQd6z/FTGtoyRgdJpKMHKtJyM2/gjcp5KhUTD6Zmi2ydQqAbJQ
	oHhqTACrTaTz8E8YhEonBC8PHqTV0L5uDTgGCuFdhEjPYGAqtJlnTL9CgmgucA==
X-Gm-Gg: ASbGncvU8WY0t2LR+JSLF53xD30g0z9vFUOIqcBWOaJtF/YGQv+pT7JkPOVWiq6GTuI
	cKugkwHXnXPvRKicmTUA8/e/A2up3Ju+R+EI0vN6lHHV9e0MJo+Y0uM/MZohWFTTfAJa1hM4UmI
	tdVUqrsaqbBcSq0x2tZH0rZAn0FjAYeCZ/pgEol//FOCDcPCG+0I8bXpS9SV0TD9HeCnNk4F958
	ZiYt9LnOhPFojxS8sN9GA6Tia3gogUgCGNeW2UQdZU6P0ZwufXZBTv6tevSQYulL/7sTFJf9srC
	TNOm+dZZ3CMnaaPnP09i7oZLfuPmDZBB0jjZfbaSF7JYqHbFJITcPxuXnvQ6gxfsPtA9G8/PAws
	=
X-Google-Smtp-Source: AGHT+IGnizYunFpSenPdVyJrCiuFufKGWT/loCBTenordDF8T4xZtxQ0l3MyreeYUCJDwjygnsUYzQ==
X-Received: by 2002:a17:90b:3f48:b0:312:b4a:6342 with SMTP id 98e67ed59e1d1-31aaddfc24amr21116327a91.33.1751901622140;
        Mon, 07 Jul 2025 08:20:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8459737csm91801415ad.220.2025.07.07.08.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 08:20:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 7 Jul 2025 08:20:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH v2 1/1] watchdog: Don't use "proxy" headers
Message-ID: <94695f5a-3a92-421e-8dfd-6cee13343a3f@roeck-us.net>
References: <20250627073753.589509-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627073753.589509-1-andriy.shevchenko@linux.intel.com>

On Fri, Jun 27, 2025 at 10:37:22AM +0300, Andy Shevchenko wrote:
> Update header inclusions to follow IWYU (Include What You Use)
> principle.
> 
> Note that kernel.h is discouraged to be included as it's written
> at the top of that file.
> 

0-day still reports:

All errors (new ones prefixed by >>):

   drivers/watchdog/it87_wdt.c: In function 'superio_enter':
>> drivers/watchdog/it87_wdt.c:121:14: error: implicit declaration of function 'request_muxed_region' [-Werror=implicit-function-declaration]
     121 |         if (!request_muxed_region(REG, 2, WATCHDOG_NAME))
         |              ^~~~~~~~~~~~~~~~~~~~
   drivers/watchdog/it87_wdt.c: In function 'superio_exit':
>> drivers/watchdog/it87_wdt.c:135:9: error: implicit declaration of function 'release_region' [-Werror=implicit-function-declaration]
     135 |         release_region(REG, 2);

Guenter

