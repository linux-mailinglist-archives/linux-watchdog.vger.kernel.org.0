Return-Path: <linux-watchdog+bounces-3739-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C8BAEA4DA
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Jun 2025 20:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 525D71C4070F
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Jun 2025 18:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88393201278;
	Thu, 26 Jun 2025 18:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eamId/hC"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1553613AA2F;
	Thu, 26 Jun 2025 18:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750960949; cv=none; b=fD1aO+GW+QVjV6jWVAlA7eRdI4TIzNHMniR3J1ol5kTcC0a4IS7kZyUO/t/Ixh7BROwsRdcZgwSp3YsF89mJZiJQCboA1j/oy/3KsQs+BqlsKHTTRdYeJ0NPtIml8Q0+ncmPc/sdL0c2n0olLjBPhaZ3fl/XZEQh8yYXKVwUYlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750960949; c=relaxed/simple;
	bh=4mUQnmWHCNRtbu/Vo04OslewYf0LZGGay8MPrdq2cvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/Rl/KzOwcZvs6mAJ3iSJvrB6nyVFBDMUvXHT0uEDDGWxZqaLpCxDyxietcBpqw+P3wfvrTa6E9zlE99xug2irshMoE6Ah5xgsR2Aw5jNJlWlCZ4/QODxesiacPMsIOuKESMA+xvMcX9FboXb+pwv84r+qmWX3YVqsf0EJraRxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eamId/hC; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750960949; x=1782496949;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4mUQnmWHCNRtbu/Vo04OslewYf0LZGGay8MPrdq2cvM=;
  b=eamId/hCdxZUYLdwq1mxOyeGMO+4G4hcbai/95yiDCnhm/ciBp4o2Ats
   OyRHY5vIvtmFCBAwE+CK/LpgBYzIYu7k3r/tiiXpGHWwaEr5r8DO+Z87o
   ERiX6GKvrRaG7fTHqvUWtelQH/Y5Z4vbEW0A10wP0oPsTOO9puKEyZuGd
   rmAHUe/wdQD+S9UkOmyTckGbjF1v60ENGqM1CCgQqHNsNVYoKkZx8nApa
   Z0ubHRddIYJZ0ju1f5tZGiKE0nhp2HW1XUsvSY8i3AOwvRHf98fSnBRzj
   qoyB5APxGzobGxkdAzCHCk5jrE7yjSFRU2fPH+2It5JMndgzbmBZ0Z67a
   Q==;
X-CSE-ConnectionGUID: VQke99H3TJiTSL6rZ/ndGA==
X-CSE-MsgGUID: l0DqGE8HRLeO8FgNzjOoZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="70699192"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="70699192"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 11:02:28 -0700
X-CSE-ConnectionGUID: iZEH1N8/TEiDULFDKgTnXw==
X-CSE-MsgGUID: 3UhGoHwPQCOT1G4XkiX9Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="157156818"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 11:02:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uUqvX-0000000AFMP-1TT6;
	Thu, 26 Jun 2025 21:02:23 +0300
Date: Thu, 26 Jun 2025 21:02:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v1 1/1] watchdog: Don't use "proxy" headers
Message-ID: <aF2LLzOIOKUfKPs4@smile.fi.intel.com>
References: <20250626165145.327685-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626165145.327685-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jun 26, 2025 at 07:51:45PM +0300, Andy Shevchenko wrote:
> Update header inclusions to follow IWYU (Include What You Use)
> principle.
> 
> Note that kernel.h is discouraged to be included as it's written
> at the top of that file.

This doesn't compile in some cases, please ignore. I will send a v2 shortly
after additional testing.

-- 
With Best Regards,
Andy Shevchenko



