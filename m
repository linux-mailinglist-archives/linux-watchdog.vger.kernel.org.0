Return-Path: <linux-watchdog+bounces-1652-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B760E966A3C
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Aug 2024 22:10:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA31C281AF2
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Aug 2024 20:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE28914E2D7;
	Fri, 30 Aug 2024 20:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUTrLqOk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C0E155C80
	for <linux-watchdog@vger.kernel.org>; Fri, 30 Aug 2024 20:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725048602; cv=none; b=Vi7E9ZEX8ojd3E2vQ2exr7Ve/CJCXQZ11KE1xkvnCw/TZy7v8nvnUng+GtYLhRUd1erAsRtnO5/Ql39jdH92EiOPCR3bOG/XscvkLFnVe+3WDlPd53K95V3RJ7YSNoUB1PhFT7ciH5wlrWtWvPiopKBiSxI29LFZMwIhhGV+Y2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725048602; c=relaxed/simple;
	bh=3Y5xmGG5shlNQvC5Xlvq5GvQVYbUB+XfYbTkWMJZWoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mf5a9KFdcoOAgIUQZKnCFPIuqREkA0DCAxNmXnB5dBSH1lQ8qsXWwiX3i6HvaG45iGVo8++6YraU5r4BFBeIMU9EwiOhMkfRTSrBsOLwFGCTzhVUYbYa+3KBcWR0Cf0dYPOpoujQjmOTd0oA4hnX2knKffvTMn6zTtnvrGYvQHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUTrLqOk; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-715c160e231so1905456b3a.0
        for <linux-watchdog@vger.kernel.org>; Fri, 30 Aug 2024 13:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725048590; x=1725653390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x3Nt9pRmq0GYgyVDvRYeauvPVyx/BK76SBNyWsyoym8=;
        b=UUTrLqOkyQ43kGeRuNcn7vppsA+rB6XlZ8o8fLMdjPRAQ0p/49AFPpjM3iq93Gdjv4
         tJ2OSf88FQwVk+PHjORUEVT3zYZbjxiuX1vTONoLuhTM0ZzT+Xe8kOpRWTTxJ4D83nC4
         P+r6E03Nup+JdS2PlAtOXFmvFDu6ccf0t5qhkiWWg2J3dEwRCJCSZh/we1CASL5MDHJx
         /ZZG2oQlh+udnniUdS8x5ONvVYvp3vd1QPj6fM0fgJxGPS7+Rt+YGam17lZpgKHz82Qk
         +yWdUVsyVQU3sFbGZD9tTCqcTpBp3atyJ/8VMHqUn74GbRnQx23NUHl6nRvx3+zG33To
         qN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725048590; x=1725653390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x3Nt9pRmq0GYgyVDvRYeauvPVyx/BK76SBNyWsyoym8=;
        b=NFL/3YoFfO4Heh8r+55mN+biXEXjUWFp0D21jvRbbGOb9nr3cQ2SEZEMnKWR/3wgG7
         Q490QmZ8dyhrWFhgRHLwhR4AivV8EAfksV9VzNeTcnRfs5MRmqCrKZyuMpOkp/u2vp2w
         3sREMJDzye/xbUVrk6+W+XiTTYVTLJNxN95TYOOO7lYijIms42vGd/eLpvBQK94AjPfa
         swOKpyPj4wXA7eQN1nShWdFGSOXUzVKogQBsKBENWdivXVwND0j3Xhdq0+sN4ZW/grtk
         UWI5lkUKVaZVtmF2odFe+HDe9fvXg05DJU1PkhtHaFnT0b73PQ0UxHNkh5nuDArOu+Cw
         BpYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsRg0eFspTGO+Y5FPpkhhkxsGPoI7Zk6+ZPGpryM/e+RVe70XfwvKW+GdwBAsy1DwcTJnW5XiDHk4LPgdK6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQzwgp04+i/H/b5V2sH5ToECyYQqzfB4ft5ClrG2riLSTAdw30
	uCCJDUMhGnnE4kYs/uUSDEdWKr7wXceXtNj56I7JMuFpM4v1hR+0
X-Google-Smtp-Source: AGHT+IF83FOgh3tb3uHKWIIUMooKJ2Okj4VvVEIBNbzTqQ9Rl+IkdRnfPIKY/Q5+vzskdFbsyMoSvg==
X-Received: by 2002:a17:90b:4c12:b0:2c9:80cd:86b4 with SMTP id 98e67ed59e1d1-2d85619bd93mr7181938a91.11.1725048590081;
        Fri, 30 Aug 2024 13:09:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8445d5e91sm6905498a91.7.2024.08.30.13.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 13:09:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 30 Aug 2024 13:09:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: wim@linux-watchdog.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH -next] watchdog: cpwd: replace simple_strtoul to kstrtoul
Message-ID: <b1ce8836-8ade-4ea8-98d0-2e893aaedcab@roeck-us.net>
References: <20240830080220.3545142-1-lihongbo22@huawei.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830080220.3545142-1-lihongbo22@huawei.com>

On Fri, Aug 30, 2024 at 04:02:20PM +0800, Hongbo Li wrote:
> The function simple_strtoul performs no error checking
> in scenarios where the input value overflows the intended
> output variable.
> 
> We can replace the use of the simple_strtoul with the safer
> alternatives kstrtoul. For fail case, we also print the extra
> message.
> 

I really don't see value in this patch, sorry. If the driver is still
in use somewhere, it would be much more valuable to convert it to use
the watchdog subsystem API, which would also address the above.

In general people should refrain from "improving" old watchdog drivers
unless they are also converted to use the watchdog subsystem API,
or unless a real bug is fixed.

Guenter

