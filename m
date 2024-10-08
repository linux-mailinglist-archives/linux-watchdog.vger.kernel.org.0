Return-Path: <linux-watchdog+bounces-2136-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F0340995479
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Oct 2024 18:33:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88136B2661F
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Oct 2024 16:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F711E0B99;
	Tue,  8 Oct 2024 16:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UHPf5+FI"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1DA1EA73;
	Tue,  8 Oct 2024 16:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728405197; cv=none; b=ERB7GJkQE3Bi/xiZXnW3j73HyP6+II0at3DBDAo01OEgr+UTIDeSB7KH3hOgM397TFkGDAaFczyMLvLnr9Sn8DluJCi9NoqvaJUYdgVkO0FJ7/grpSXWPgPCndw7surb0j0WDlTvSkNx/Hr4dk0MPciwP412Sg9RLOytMy/VLl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728405197; c=relaxed/simple;
	bh=ABYLgna9ik3Qw3mklNtm//dxT/ojFvjCVfeIpWSQXx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MkhqYc52cUULqg9M3fx8w8SuHaAyVjdYJDMhY8WVzqaKh5U3CBZBnT8C4tlekdAmmRZyrXVRiAfFzMzqaKyEFWVXzUTOa0ZCVDHp6qla9HedS0m0zDcVXYews6bI4myGeLcGD+eE5kV+7pD/PU7mqP/cTnHt+VvAUS8V47SSJEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UHPf5+FI; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728405196; x=1759941196;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ABYLgna9ik3Qw3mklNtm//dxT/ojFvjCVfeIpWSQXx4=;
  b=UHPf5+FIMm3hs4oEeJAcEAk+oQz8BJP2oYAScCyh/hMe8vrwmOkwMx17
   qTONI01VZwwy9ZT2cPHkpO0ArNygIlBw/YbHzf5oSxOoKk3+0lycU0Aqg
   /Qe67Jbzmrna7krg0RzqLnVZB7EJ2PPM84VwfCy4JZr5j8NZOG0YMCl2P
   rR0XbmXNN15kmtCRVKACWhRGRRd7gb1GletpSa3kTsUSVv3tiGAxZyHVz
   1N5wRAgA/7IkWXhUSesgXnZaL8YWdSJDZZ7evACkyIAmQpuo1cLthZ5H/
   mYBQsbh1/CcqTNO6gqroIYe0dpH59pDaiMBYlh9SwdTb0UgxillQOpSW4
   A==;
X-CSE-ConnectionGUID: Z7/Sn2zES+OJ/8Zs/E6TaA==
X-CSE-MsgGUID: yK35D0XETeuSHuXYF8biqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27710411"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="27710411"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 09:33:15 -0700
X-CSE-ConnectionGUID: AQyTA9GQQ96nhOK24BJtMw==
X-CSE-MsgGUID: XANtgy2WQj+5FMfNuLqwyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="75572678"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 08 Oct 2024 09:33:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 3123720F; Tue, 08 Oct 2024 19:33:12 +0300 (EEST)
Date: Tue, 8 Oct 2024 19:33:12 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Oleksandr Ocheretnyi <oocheret@cisco.com>
Cc: linux@roeck-us.net, jdelvare@suse.de, linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
	wsa@kernel.org, xe-linux-external@cisco.com
Subject: Re: [PATCH v3] iTCO_wdt: mask NMI_NOW bit for update_no_reboot_bit()
 call
Message-ID: <20241008163312.GS275077@black.fi.intel.com>
References: <05dba51b-7c3c-4455-9c97-09777e885fac@roeck-us.net>
 <20241007155702.3676667-1-oocheret@cisco.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241007155702.3676667-1-oocheret@cisco.com>

On Mon, Oct 07, 2024 at 08:57:02AM -0700, Oleksandr Ocheretnyi wrote:
> Hello Mika,
> 
> > I suggest adding some #define for the magical number 8 so that it is
> > easier for anyone looking at this driver to figure out what it is doing.
> 
> Are the changes with #define NMI_NOW bit fine for you?

Sure,

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

