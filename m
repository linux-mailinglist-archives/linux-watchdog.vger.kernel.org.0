Return-Path: <linux-watchdog+bounces-2415-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 634AA9BD12C
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Nov 2024 16:55:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED485B22764
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Nov 2024 15:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF8714BF86;
	Tue,  5 Nov 2024 15:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H1y7x+Ny"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C1314A4DC;
	Tue,  5 Nov 2024 15:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730822127; cv=none; b=kNnj3G9IwVyl6e1Ahl/kE5XyVgH8ZP1sh3k/HaRgTmOQbUWraDNcrB+YtFNqqLYV7kEzoUncRbSyTZKIwtRbFSxNJVulnNDDhykRkM5S1QD2bECcKZgImgoCUBXWV2AGvC2kWZDq1rtqiSuqoLlIFdpqlW+9lh3+6jvWf10xan4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730822127; c=relaxed/simple;
	bh=cMvTh8PxTSmZ112HIDfP6ZSowBcMCKVJTesKcB3gvwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U5GiDGKT8rHId67/i4sGE1pOzg9S1q1IVe/Wv2s0XP1MPBdDS558fT+B5IdnvrIWBdnXvzS/cWfz2dfXuQJL4QYPuMkYlx+wALE3TJQfAz1TITjwYV4n9xknT0OakI2KsqcK51xYpFBFjxOpd19VcHhULnvDimDTbtuty/3gywk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H1y7x+Ny; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8686AC4CECF;
	Tue,  5 Nov 2024 15:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730822126;
	bh=cMvTh8PxTSmZ112HIDfP6ZSowBcMCKVJTesKcB3gvwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H1y7x+NyhnuuyB5F85fhewQ2GPZQXp7zTj5nyJz/ECA8hH1QUxx5PW6fwWEKnW7fH
	 1G8sTZek5eZ+kwBpCOBfg24Am0Frdtdxg/+PLjpyhjy8XYOaqC5CrlaaSU68crFl1c
	 EjYclJ5GBgx0kUmRjDwgtZu8yz1xJevhzsHGsW5kyJQNlf0TrG+g/JUdZpV7alVkQh
	 I2vFAcPfmwejx+xjYiS14ScmQc1SUt3jC5wRo0+1yTnWsgu+JMJhErOuej/IE1KsKl
	 5q+h9OR7BtYrmxdJfYEY8/sonX2GPLy0v97KyEJnkL3xGF8hYR9mTVlAif/XqJqaRV
	 teMxarrdIZ6UA==
Date: Tue, 5 Nov 2024 15:55:20 +0000
From: Lee Jones <lee@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: konstantin@linuxfoundation.org, baocheng.su@siemens.com,
	tobias.schaffner@siemens.com, pavel@ucw.cz,
	ilpo.jarvinen@linux.intel.com, wim@linux-watchdog.org,
	linux@roeck-us.net,
	Benedikt Niedermayr <benedikt.niedermayr@siemens.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, linux-watchdog@vger.kernel.org,
	felix.moessbauer@siemens.com, christian.storm@siemens.com,
	quirin.gylstorff@siemens.com, chao.zeng@siemens.com
Subject: Re: (subset) [PATCH 1/1] MAINTAINERS: replace bouncing maintainers
Message-ID: <20241105155520.GC1807686@google.com>
References: <20241028112359.3333152-1-benedikt.niedermayr@siemens.com>
 <20241028112359.3333152-2-benedikt.niedermayr@siemens.com>
 <173048213838.1966999.11456105703949125929.b4-ty@kernel.org>
 <0f27f32e-bf00-4f9d-a0b6-0625a6dae203@redhat.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f27f32e-bf00-4f9d-a0b6-0625a6dae203@redhat.com>

On Mon, 04 Nov 2024, Hans de Goede wrote:

> Hi Lee,
> 
> On 1-Nov-24 6:28 PM, Lee Jones wrote:
> > On Mon, 28 Oct 2024 12:23:59 +0100, Benedikt Niedermayr wrote:
> >> Since complaints about bouncing maintainers raised [1] we have now a
> >> replacement for maintainers that stepped away from their duties.
> >>
> >> [1] https://www.spinics.net/lists/platform-driver-x86/msg47105.html
> >>
> >>
> > 
> > Applied, thanks!
> > 
> > [1/1] MAINTAINERS: replace bouncing maintainers
> >       commit: 64dd44a658065ab5595bbfe2cb4d8fd30c9e34a2
> 
> I'm not seeing this on either of:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git/log/?h=for-leds-next
> https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/log/?h=for-mfd-next
> 
> ?
> 
> Note I'm fine with you picking this up, I just want to make sure that
> it does not fall through the cracks and drop it from my own patch queue
> since it also touches pdx86 MAINTAINERS entries.

I'm pushing it through the LEDs tree.  It'll be in -next tomorrow.

-- 
Lee Jones [李琼斯]

