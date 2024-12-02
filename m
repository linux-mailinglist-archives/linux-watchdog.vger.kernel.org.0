Return-Path: <linux-watchdog+bounces-2493-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1233A9E0CEC
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Dec 2024 21:19:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1AC46B2B218
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Dec 2024 20:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42371DED6F;
	Mon,  2 Dec 2024 20:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IUFSmdkh"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B6D1DED6C;
	Mon,  2 Dec 2024 20:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733170727; cv=none; b=LJZadFDiqxeCAilzgGSStih1jt7mJB9iUSZbObGDqWfToDPB9ok4K6FhYNi71p40OKJZy1lwjbnH5ldoy091Ga24jJ6DCiuKDMOzCu1dcF995JoyiwDN+6X+kn7do9ULaHbLx03PYvA8CQV+IR+PpyqDk51XY/Sbs+j+uBujmbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733170727; c=relaxed/simple;
	bh=Ve6Id1ppBaKJCd3M7IES4qBvZRGWYqR1ydHN9FQFHd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MvpTJM7Ho9r2K80G8yp/59nAyl9ByN4WcbZZ2MRGCEUHXhQu2ojfqKbXJgdL8iAk6fb5cS+Q6L/aFyuRuCjNIVldvtk/uTyfkyN16SZYpdauokzQd9mZv7J0IiHT3SKQX3Pp51ZhmHP+pfVpIWe+9OIzjGKZX12tOXQQskkHZFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IUFSmdkh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8E6C4CED1;
	Mon,  2 Dec 2024 20:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733170727;
	bh=Ve6Id1ppBaKJCd3M7IES4qBvZRGWYqR1ydHN9FQFHd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IUFSmdkh0e4OFv+FjQfVAH6Dk0h9D8HRcdFPzLmYxmzmg4GPl1a3SOthdM9u6LkX1
	 R6XBGj9aC0xDEmK/JSTIBaD8uTL2DrnBkwGYpT3k0huHzxGY0cCD9crnFM9q2u8sDv
	 JYVwflUCiTyq9T2IG1RkzxYdGR11rKWi2vY//8ik7vV95Va+t6O4uKR+RP6XDX5Tkk
	 twSQzxvg8nycg3UwKNhJU0JG27ssvMit6F9u0a2XLmLS6g9b8GVG+7UWpESAtNNJEn
	 YJHxhuXCzxNfa3yOyqwKMnIn93wYAeeAs0B4/1UndEJac9Wu3DIV31t4doBiZjFzgH
	 I7/B3HrfS/kKg==
Date: Mon, 2 Dec 2024 15:18:45 -0500
From: Sasha Levin <sashal@kernel.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	Byoungtae Cho <bt.cho@samsung.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Fabio Estevam <festevam@denx.de>, Harini T <harini.t@amd.com>,
	James Hilliard <james.hilliard1@gmail.com>,
	Jean Delvare <jdelvare@suse.de>, lijuang <quic_lijuang@quicinc.com>,
	Marek Vasut <marex@denx.de>, Nick Chan <towinchenmi@gmail.com>,
	Oleksandr Ocheretnyi <oocheret@cisco.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rosen Penev <rosenp@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	Xin Liu <quic_liuxin@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [GIT PULL REQUEST] watchdog - v6.13 release cycle.
Message-ID: <Z04WJYlsYQABwAZb@sashalap>
References: <20241202181849.GA5357@www.linux-watchdog.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20241202181849.GA5357@www.linux-watchdog.org>

On Mon, Dec 02, 2024 at 07:18:49PM +0100, Wim Van Sebroeck wrote:
>are available in the git repository at:
>
>  git://www.linux-watchdog.org/linux-watchdog.git linux-watchdog-6.13-rc1

Hey Wim,

Have you pushed the tag to the repo?

$ git ls-remote --tags git://www.linux-watchdog.org/linux-watchdog.git | grep v6\.13 | wc -l
0

-- 
Thanks,
Sasha

