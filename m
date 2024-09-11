Return-Path: <linux-watchdog+bounces-1862-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C48C697556E
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Sep 2024 16:31:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E0A31F23B9E
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Sep 2024 14:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A771019E971;
	Wed, 11 Sep 2024 14:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jRV/Yr2K"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D2D189F2D;
	Wed, 11 Sep 2024 14:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726065078; cv=none; b=iaredDVcCwPAK2jsdZcJO3U3crrDWGcnZWLMtSu6DqhZ43l4Rk5crcjPUlZN9rEYhLCuqbagaErwq1tCXDDtNompV3+iNcz07Jvqht/jnV2+MGgr4cAdMTuJVzEXlWg1A6KnSB7bSomGx6ojYwk3fJu+dqro0j9WywzPOzlZ+VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726065078; c=relaxed/simple;
	bh=VTTCHBWn7GfC9VhRbY/JMqOVPu/nwPgiAeRqrezq1eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=go5oyTR73f7VeOT6kRXQtboqVp8UNzbbTbLMsGOceyeRw5CqpkhZGmSSaWlmuldNjL9aqX1NoLNaUQCjlHZQyP2Fpyx1VaVhLe+43tV9tWw3L3GEerVbU+ymuFSmE8hCNZYrx9Kz5gHlw8Yf3Dt9c4CkMI+eq7IO0y08ZB1ktPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jRV/Yr2K; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726065077; x=1757601077;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VTTCHBWn7GfC9VhRbY/JMqOVPu/nwPgiAeRqrezq1eo=;
  b=jRV/Yr2Kpabh2/cUUS4UuZBQaz+kF6/ELKn1eDNovTUJKW1nbsv8MYdk
   tf/+3FzRmZzaEVWQ9F2Kd2D7g1QaTz+n0775hAkuNO31d1K5X0lRQm4K4
   Xv/R0n6Y4HbFgbOOGjyCfP9EtgLJ+Rxmg6+v0zgx+Pmin4Z4xXXPjFvs/
   EWSDYk4Z/hgC4LgB81PVsThvjXXpa7VJe1leB6vrE/F3rPbBSsvdCruHH
   2OFELxTaRntgDeg2AqKFZDh+glhzzR4d3cYzxSQ9bR9WCIH8XdwZ1fkKy
   8Jar8gI+vPJRl7NOcFVY/rtsy+SttXXZ61Z8kEnYiyhSjLNKuFrGMmChc
   Q==;
X-CSE-ConnectionGUID: pZTBq77jSYim2jgx2n+zeA==
X-CSE-MsgGUID: iYOuBFiyQ9+A6w4EXkmdGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25061901"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="25061901"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 07:31:16 -0700
X-CSE-ConnectionGUID: 77U4sYcsTN6tu+fYXwRfyA==
X-CSE-MsgGUID: xRpIsvywQymyPMGCUzcJbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="72167854"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 07:31:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1soON8-00000007aJe-3cPn;
	Wed, 11 Sep 2024 17:31:06 +0300
Date: Wed, 11 Sep 2024 17:31:06 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Utkarsh Patel <utkarsh.h.patel@intel.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	"David E. Box" <david.e.box@linux.intel.com>,
	Zha Qipeng <qipeng.zha@intel.com>, Lee Jones <lee@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH v2 0/3] platform/x86: intel_scu: Move headers to x86
 subfolder
Message-ID: <ZuGpqqfEXNLjrGoa@smile.fi.intel.com>
References: <20240909124952.1152017-1-andriy.shevchenko@linux.intel.com>
 <9158a89f-6e06-41ad-8c68-97ecc3409c16@redhat.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9158a89f-6e06-41ad-8c68-97ecc3409c16@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 11, 2024 at 02:27:47PM +0200, Hans de Goede wrote:
> On 9/9/24 2:41 PM, Andy Shevchenko wrote:
> > Add the record to the MAINTAINERS to follow what is going on with the
> > Intel MID platform related code and drivers.
> > 
> > With that, clean up a bit a couple of headers, i.e. move them to x86
> > subfolder of include/linux/platform_data where they belong to.
> > 
> > No functional changes intended.
> > 
> > Taking into account nature of this change it's supposed to go via PDx86
> > tree, please Ack.
> 
> Since the changes outside of drivers/platform/x86 are tiny and the merge
> window is close I've decided to take the series without waiting for acks:

Thank you!

FWIW, LKP tested more than 200 configurations with success and I locally
have these device drivers always enabled for build, so I do not expect
any report from more or less standard configurations for this platforms.
If any is given, I'm here to fix ASAP.

-- 
With Best Regards,
Andy Shevchenko



