Return-Path: <linux-watchdog+bounces-1049-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B40778BFBE5
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 May 2024 13:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68EB81F216B1
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 May 2024 11:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E70FC81AA2;
	Wed,  8 May 2024 11:23:30 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC593F8EA
	for <linux-watchdog@vger.kernel.org>; Wed,  8 May 2024 11:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715167410; cv=none; b=mhpZXFJM48O465uYN+P6/DX2ja9eiLO6HdgskbU5LAkNevdZ/lPxL25mdMba766zRXyKwj3/gsazNH5gJNILhix3zEmoF7iYghEuz1u6bgXm8VnXARGjtp5rNMxL/VQ+v20m/eS6xlZ7jMn7mgYsIBnhufsHkgHmwZbRw1GSZwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715167410; c=relaxed/simple;
	bh=N0lDF0v+P8lR9gmS5FsF4tJzV15N1gfOXVaaXvJ7QIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hiTp0ziMwf/TPHdkAj4VW97o43z1uCZp+Unoxu/pX2TmqnAKGgVCuMEDo5ntX/pmK6gLiyDMAd/UzRUJW3sSVOfC9/YooHa60GWIjRZcNk0lDMTwemc8PBeHAku1hkay1XgeYNzRjJchwQyaVPVAC0TDjfZvFjdvbmN5sbImRIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: /p0Pest1QTefECZnmP7ajg==
X-CSE-MsgGUID: vDM8cFGZShGoMZMLtRwr4g==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11182123"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="11182123"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 04:23:29 -0700
X-CSE-ConnectionGUID: DDDUpA6HSwGhnsuqPO2K2Q==
X-CSE-MsgGUID: SpWFN6DVTrizRaGQVsd3fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="28728808"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 04:23:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1s4fON-00000005PTS-044g;
	Wed, 08 May 2024 14:23:23 +0300
Date: Wed, 8 May 2024 14:23:22 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Guenter Roeck <linux@roeck-us.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-watchdog@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH v9 5/9] platform: cznic: turris-omnia-mcu: Add support
 for MCU watchdog
Message-ID: <ZjtgqnOc6xzTLAt0@smile.fi.intel.com>
References: <20240508103118.23345-1-kabel@kernel.org>
 <20240508103118.23345-6-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240508103118.23345-6-kabel@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 08, 2024 at 12:31:14PM +0200, Marek Behún wrote:
> Add support for the watchdog mechanism provided by the MCU.

...

> +	return omnia_cmd_write_u16(mcu->client, OMNIA_CMD_SET_WDT_TIMEOUT,
> +				   timeout * 10);

DECI (from units.h)

...

> +	return timeleft / 10;

Ditto.

...

> +	mcu->wdt.max_timeout = 6553; /* 65535 deciseconds */

Ditto.

	mcu->wdt.max_timeout = 65536 / DECI;

(and no need in a comment)

-- 
With Best Regards,
Andy Shevchenko



