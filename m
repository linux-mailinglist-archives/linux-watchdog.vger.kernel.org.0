Return-Path: <linux-watchdog+bounces-2096-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E04BC991658
	for <lists+linux-watchdog@lfdr.de>; Sat,  5 Oct 2024 13:19:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D91301C21EE3
	for <lists+linux-watchdog@lfdr.de>; Sat,  5 Oct 2024 11:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4D73136331;
	Sat,  5 Oct 2024 11:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AJEp2oqY"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8E4F9FE;
	Sat,  5 Oct 2024 11:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728127154; cv=none; b=XlTWgQclY/S5NhpdBYuy/EEiTralxOsXP1hi0jv5gze2t/dEycFIjPI6kZ4MSrSGuyAwJLC5Cjac/DzeJ/8OflRATm/lOVDi8u+3ijSxVK/7rGm+GMdT0jKQZ5zy/ezY87+5QaPwPy+1jY8ul5ulZEi6OuyICibgY8IjQvueYGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728127154; c=relaxed/simple;
	bh=0RwjxO89VD+yjE7XVrkryCZcjVDwE4OK7/WsueWQVlU=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=B2GhkHAbXTF7j2hWRkCS7ekUsG1Ip0s/alEQmKeZajBVcrHDm10DhKItQevZZIPhsVOZm45f2LTf5aw8gN+czRyVAZj7skOOCFTU69n+GXA2Cr/Eq0370oEmiCvLDcgFIJaMLVGSDqI4+2eeIXySpI2tmTxLg5FOvK6mEO6uk/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AJEp2oqY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3009C4CEC2;
	Sat,  5 Oct 2024 11:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728127154;
	bh=0RwjxO89VD+yjE7XVrkryCZcjVDwE4OK7/WsueWQVlU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AJEp2oqY6RW+lXqhWz0y+88KbQlEHaBFLzg+ha6fO8BywS3ZYZv9m6OHS5bWCgNZZ
	 fmirnyjXsnaqLU8rEybsWeIoMmLQHjPMxMoH4pCbtr7LPcyGToxTCnPWwwrR8033k3
	 tnMvrc/7hzFIwV5Y2slJT49/XL26KtKWPmsBOdDP8tULWsi3GfIWaCZW/lgULRaC3X
	 hJELiyoR9IRAAWRKEQV3qv0wAgxvzzia/UyWUyyHbkqag92ZKk3IEuLlK7s6Ig/yiF
	 RfS/+kAeKF5J2imKAbciZhQeNiDpFptThIgFog9LmUohIylbkk5r0NNztdxRKERZQY
	 jSPaSU9A6W0Hg==
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 05 Oct 2024 13:19:10 +0200
From: Michael Walle <mwalle@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 linux-watchdog@vger.kernel.org
Subject: Re: [RFC PATCH 9/9] watchdog: sl28cpld_wdt: don't print out if
 registering watchdog fails
In-Reply-To: <20241004200314.5459-10-wsa+renesas@sang-engineering.com>
References: <20241004200314.5459-1-wsa+renesas@sang-engineering.com>
 <20241004200314.5459-10-wsa+renesas@sang-engineering.com>
Message-ID: <32e76628b5da4a5dc98801ae017498c3@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

> The core will do this already.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

Thanks!
-michael

