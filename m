Return-Path: <linux-watchdog+bounces-2405-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B03C99B9685
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Nov 2024 18:29:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74E91282715
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Nov 2024 17:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B09AA1CC154;
	Fri,  1 Nov 2024 17:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l7gPRhqW"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8ED1CB51D;
	Fri,  1 Nov 2024 17:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730482142; cv=none; b=m2Kgitbc7Vqy4rA9KdRM2u+lViEKTQ0cUyAS5bSeXyotBA6U21EqbwhOt5mboSk4TQsDuWxR9zK6Y6qIijlonlYdKW2X117CjczPHzGX2wF2ZqX8qbIDN1BDAhsXMNK98weNI6U1j/+uzyNr8GieGEpy+JqzbH01ujZqMpYngJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730482142; c=relaxed/simple;
	bh=4ObdLgIjzj23wYw/sQg++/AHprXOYE8wFgZIRNOb5Jc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EN8d+ZQiI+kXYDENpDcki8SNuhJ5tc2g+KySs+y+zcuTBXh4NMjxFcaeanu+gq4aKRr3cnbnzvTUD7E88ccgYJODAaTOwRJjYOav9eahX4ZDaoNBy6NPcEzCRSYQlSjtH+3eMzScGIV5OpzKvPOaM71ryVuBoxUODeG35iC8ihA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l7gPRhqW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A642DC4CECD;
	Fri,  1 Nov 2024 17:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730482142;
	bh=4ObdLgIjzj23wYw/sQg++/AHprXOYE8wFgZIRNOb5Jc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=l7gPRhqWjbYVYSPjCgRwwzRWWxYgbU74Jz6gZdmPV3Kfj4Kxghh1ixMc0KpBG1kXS
	 qvPUxdOr9CgEDg8ez8lngHMzm8ThaCVoJL9uL+532rjXLlq68oPnBbR1EqSqy8Z1Gg
	 KNnyK4RYLZk+1OPWst2GXptGeUpG8ts1rDl27c5dv5DA5+OLj4qyq1IAfW8EWInN1v
	 mpwvv1XRzdvhXV9r88dktTQt5mabcls3HPNLESqelfewnQRvZaT/nNbhSaiUgztJ2K
	 DRnylYabWMdNQhSbQ2a/YZ6YXloY+5L+lpyIADVl7gyqvnoukzFbZPzAoqTpZeuzAx
	 wrG/zZrCRay8A==
From: Lee Jones <lee@kernel.org>
To: konstantin@linuxfoundation.org, baocheng.su@siemens.com, 
 tobias.schaffner@siemens.com, pavel@ucw.cz, lee@kernel.org, 
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, wim@linux-watchdog.org, 
 linux@roeck-us.net, Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 felix.moessbauer@siemens.com, christian.storm@siemens.com, 
 quirin.gylstorff@siemens.com, chao.zeng@siemens.com
In-Reply-To: <20241028112359.3333152-2-benedikt.niedermayr@siemens.com>
References: <20241028112359.3333152-1-benedikt.niedermayr@siemens.com>
 <20241028112359.3333152-2-benedikt.niedermayr@siemens.com>
Subject: Re: (subset) [PATCH 1/1] MAINTAINERS: replace bouncing maintainers
Message-Id: <173048213838.1966999.11456105703949125929.b4-ty@kernel.org>
Date: Fri, 01 Nov 2024 17:28:58 +0000
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Mon, 28 Oct 2024 12:23:59 +0100, Benedikt Niedermayr wrote:
> Since complaints about bouncing maintainers raised [1] we have now a
> replacement for maintainers that stepped away from their duties.
> 
> [1] https://www.spinics.net/lists/platform-driver-x86/msg47105.html
> 
> 

Applied, thanks!

[1/1] MAINTAINERS: replace bouncing maintainers
      commit: 64dd44a658065ab5595bbfe2cb4d8fd30c9e34a2

--
Lee Jones [李琼斯]


