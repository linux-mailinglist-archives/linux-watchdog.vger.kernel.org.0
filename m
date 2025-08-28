Return-Path: <linux-watchdog+bounces-4075-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BC3B39C35
	for <lists+linux-watchdog@lfdr.de>; Thu, 28 Aug 2025 14:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E06F016AF38
	for <lists+linux-watchdog@lfdr.de>; Thu, 28 Aug 2025 12:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F1930EF9F;
	Thu, 28 Aug 2025 12:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VpnXROJP"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFF626F2B8;
	Thu, 28 Aug 2025 12:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756382849; cv=none; b=DgYKLf2mQquTHN5TYxgGJo3lOBsdi6AfIP9QwAij2xILqK0SeTzLiGt9tNcMSjLxLsX2ycFdYlHrUly8YhReQ5h1ZVLjSEy3tdkkKs5xPEO20thcGFLYH9F7aPu0BIivSu+5mOQ0vnTqVlr0QLBrNyo8BJTKL+jUCxmgT4Bw2Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756382849; c=relaxed/simple;
	bh=N/6i/VetJqyIgu+uzBDXEe8AtusjmLcQrJiPWob+ZIQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Xtty4RDOW6Z/BmHDlS+F25qJ2PIYnDiOMawcFcwkhwL/v4wAKyp+/NynXhLg3XRTQOdg3dCeVd1rbe5R6b0WGC4dKGcKDZKMkt/+97FpE3Gg9n3TvJI5NKGPHCzLRqWGRp+tVVuPi0+uuXTQ5GKgNxjZxYwR9jdNwmpMLfIW2u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VpnXROJP; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756382848; x=1787918848;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=N/6i/VetJqyIgu+uzBDXEe8AtusjmLcQrJiPWob+ZIQ=;
  b=VpnXROJP1IIPGfUql1LBRYim/kLzC/Ig1UPZX5FUhHp9Yw6c7rIFoMWK
   TIC4HCpULFujJ6l8D03ryhPRO7uEZrShgc8TkJ+669GemKXClBDpor4Ig
   vYZEthrPBlYZ3BnZuDL47q4yyb5vdU7/PN5hojpbmvcUrm1RzmxJ2Uwf6
   PJOdVP568HK6P/2kCb4z9CnIGAOsCo/svr7LfFd8iHGgZyz9H5TxiDhY3
   uJg9rEUdIV2Y0gYSI13f8mwonTbEA9nekPZVx6vnpjTZZ64tkju8/bNZ2
   132RMQoZ/4uVzuM+YdYGJnA2qKHkGARNq2xiqBcj4iqEPqseG/q/ghv+C
   A==;
X-CSE-ConnectionGUID: gcrBP2r4TZWs9VdPmqgvag==
X-CSE-MsgGUID: wh8UgemyQBOohMYb4lSecQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="62473021"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="62473021"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 05:07:26 -0700
X-CSE-ConnectionGUID: 7TW3MlpbTr2RQTEYYGIjww==
X-CSE-MsgGUID: 7YN+U6AsSRKmngbwvVFs8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="174487957"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 05:07:23 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: wim@linux-watchdog.org, linux@roeck-us.net, 
 Hans de Goede <hansg@kernel.org>, 
 Yen-Chi Huang <jesse.huang@portwell.com.tw>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, jay.chen@canonical.com
In-Reply-To: <c9cfe602-c279-4aa4-9932-76f47f26556c@portwell.com.tw>
References: <c9cfe602-c279-4aa4-9932-76f47f26556c@portwell.com.tw>
Subject: Re: [PATCH v4] platform/x86: portwell-ec: Add suspend/resume
 support for watchdog
Message-Id: <175638283803.13908.9890587518542106964.b4-ty@linux.intel.com>
Date: Thu, 28 Aug 2025 15:07:18 +0300
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 28 Aug 2025 13:31:17 +0800, Yen-Chi Huang wrote:

> Portwell EC does not disable the watchdog during suspend. To avoid unwanted
> resets, this patch adds suspend and resume callbacks (pwec_suspend() and
> pwec_resume()) to the driver.
> 
> The watchdog is stopped in pwec_suspend() and restarted in pwec_resume() if
> it was active before suspend.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: portwell-ec: Add suspend/resume support for watchdog
      commit: 54cf44517550d53960d2fc5f85cf55d668c8889d

--
 i.


