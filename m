Return-Path: <linux-watchdog+bounces-1042-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A18878BE34E
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 May 2024 15:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 594F11F27B26
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 May 2024 13:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE59A15DBDD;
	Tue,  7 May 2024 13:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KompdNcD"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221B415DBD3;
	Tue,  7 May 2024 13:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087764; cv=none; b=kn5Wz3XK2+hp8Rjfo1db124QZibRsKaYcDAzR1VEnAtF9wOf7bs5p0f0b/+Mt0X6kHio8gwomQmdqDaVSGhgXJPxdUPHsNY/z7VGuc/LRY9z5xicdEY/ii8wZbZnAp0WCNqqQsshtSa9bJaDxE9Xzc97sbTVfJUhxf/tT0JzTQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087764; c=relaxed/simple;
	bh=CSHvMAs67CMAX0qR5heYWRzFtdWhrCIRTColjkXx+AY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jPYAPdwJGsVyJTL1mjp3Ek/FmB9PztY2ZZOdug4BRP0rTEmVS6iFi+13wFFvc+WJdINsd+Ky0Ck2wiT89j6f0nolKT+g0axI1ug05jDispKnqIZ1DxInDQXHrcB4iKotu4f0YPpyQabqYGisM65LKOoXmnl++KsK3RU5tmqfqyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KompdNcD; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1ee12baa01cso15941755ad.0;
        Tue, 07 May 2024 06:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715087762; x=1715692562; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j1N4kQVDivHuDZ3cnhNAz0y1QId4Za0FFOGzLKybZ/c=;
        b=KompdNcDVGywYKtX0ZYcJG/BQA2wdWKHOisD8jpAGgciPKzSehqRhADoFA1OydRe/X
         xEa/Q4yXMvPDPSJ7/JRgSCHO0Ux0xM3/OlwFEJ1RdrZ8D8ieNPMuZiUXPnt2SAtY4dPH
         +gR/khJbkVGdDduFF0Rz/e2CnjROtzNBptEDUVBr0EXgtoTxp8slZX+OTm1UO0jZdweX
         9EcQ4rx5AKzIyk3XRSYD5QUTzqKdWE3dMHap/LYbdLm917ognu5iHXFdg/Yx5k5+LOlp
         dFaFn9qZr4PA//xTg7/AE/t1CCywhc39GDNf+J/3+kITUb8J6r8g01J2q12a6l7PivYC
         W0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715087762; x=1715692562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1N4kQVDivHuDZ3cnhNAz0y1QId4Za0FFOGzLKybZ/c=;
        b=K2dRQ1V6eIxnILgKtQ08UMYvEbvZLEZPY9jWQdroM1XkSiIzZFGO3tlLQiyC9y/Fqf
         m1k7QWkqPawDVP43N5Ypytg4wRjVxlin6y5x6h3VTxUdMIuufHdJG4kCZsCTu/51Evz2
         mxSWdb5bRbajEqBObKllkAUmZc2rIP5ni2MBHiBDOMVD2YuJJI2NZgu8ikux2xh5ZD+s
         12EKNWqbQgShgRwHuVnOwuD6Xr7bCivFA5mQCLKddEd90GaOSAhdzSC27YMvLSrnZRT8
         ZQ/mPz/oV8CH0rmKp63Bmk6024UG248G6gkMBI7Pqk2qjPzGXwa0YanqOEpK/SQSjrpx
         R11Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKbRAs4oXAu6yndKyH4vCf904ja5ECmDiYTjfav1gTGDUSk26aABLwwaDqIwyvQjGvzKg5IOvGG9uEvDjL+WyHlDqbzO2maYTLExyJJOghvgVxVnob8uGm7HHZF/UNQNdGPFSWGYJPQDM6DqM=
X-Gm-Message-State: AOJu0Yxr7MDDR+0w6fWVz42piEUFtdL7TOTWmbE2JadLPAtPSRSL7MUG
	5KpVIH3/k0DhviEpFhMhaxRWRiBdwkP6ybIYTpljzm9NcXXXOlFR1ymqhw==
X-Google-Smtp-Source: AGHT+IFwvfkckNeIcRKYiHswxfGB0vH+FpLdKk2b4RJBcf1AhllrmozSSKr387nx2PAhLWJOc1vVBQ==
X-Received: by 2002:a17:903:22ce:b0:1e1:6850:f823 with SMTP id y14-20020a17090322ce00b001e16850f823mr15466076plg.13.1715087762302;
        Tue, 07 May 2024 06:16:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id lf14-20020a170902fb4e00b001e556734814sm10012725plb.134.2024.05.07.06.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 06:16:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 7 May 2024 06:16:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, David Ober <dober@lenovo.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: LENOVO_SE10_WDT should depend on X86 && DMI
Message-ID: <556527c1-f1ae-457a-bcb0-a2ff4abecd47@roeck-us.net>
References: <58005595a05ef803b454b78d3ae9b8ee0675bd5d.1715076440.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58005595a05ef803b454b78d3ae9b8ee0675bd5d.1715076440.git.geert+renesas@glider.be>

On Tue, May 07, 2024 at 12:07:56PM +0200, Geert Uytterhoeven wrote:
> The Lenovo SE10 watchdog is only present on Lenovo ThinkEdge SE10
> platforms, which are based on Intel Atom SoCs, and its driver relies on
> DMI tables.  Hence add dependencies on X86 && DMI, to prevent asking the
> user about this driver when configuring a kernel without Intel Atom or
> DMI support.
> 
> While at it, fix the odd indentation (spaces instead of TABs).
> 
> Fixes: 1f6602c8ed1eccac ("watchdog: lenovo_se10_wdt: Watchdog driver for Lenovo SE10 platform")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

