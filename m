Return-Path: <linux-watchdog+bounces-4534-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EC1C42AD6
	for <lists+linux-watchdog@lfdr.de>; Sat, 08 Nov 2025 10:50:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC6B1188E284
	for <lists+linux-watchdog@lfdr.de>; Sat,  8 Nov 2025 09:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6C3221DAD;
	Sat,  8 Nov 2025 09:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nVlWxY5Q"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D267134AB;
	Sat,  8 Nov 2025 09:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762595438; cv=none; b=npo0S8kCGAMUJvdsmMAQmlYiOnyO1dg61ubILzRgwF1RSGZX7Mm6SQ0Rmid0dX+ttSc8WvLvEeTD8AW+8yX24kYqfD+HDgJOODOYbadsosl32sNvvJ6b9zfvFtSwMGYGO5f7w7YyV7H7jA0saGh6NrTPxN65AwiLVDo5VJhzqNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762595438; c=relaxed/simple;
	bh=VYp6JlktlNtSBhhVtta20m+Ma5lCPncZPlU8aCP3RDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPkDgqelv/AK4RsSnSC5qviH6T7BJ6qwaPvYZNj+dZPZkum1+2urRGp9Gn6r3vA0s+lGXOzL+JH9sLoj97gAeac69FlATzji4KGEuH+pSc1CtDtA3SoSBl9dWd+08kDlDt7AotB6jh6qWlYLoKi1oD4RA9OlmoF3T8gHRSXPt/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nVlWxY5Q; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762595438; x=1794131438;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VYp6JlktlNtSBhhVtta20m+Ma5lCPncZPlU8aCP3RDw=;
  b=nVlWxY5QhscQzoaYWQE1Mw4QGO09F0/7IBcbXc3Kq+alE8OYdzRBhv7J
   rhjEpvmtD67cCvR9bApj2nhcdkbF/WogfXzPxZ6fX/Hv/QvpBEFRw1xpn
   gg5Os1ET4fD6OLZpXkTLq+fagZprfh4wcgQhgVqVvAoCW1kojNhqQ7a0h
   D6JVz4PTXOP5BcV8qGBnACYyRr8CH/7/MMnflmNoZ2N8nsaDw0x9RUR04
   dkHH1xKmizPbA6OepDHVidTVYJNOtxT7DmnwBvfomtPs60vujeq7Q6+QY
   mTLv6JhMK3dSka3wM1MNj2buTesNPdzvmM6sScDOy41xnVXTzZy0h5kF/
   A==;
X-CSE-ConnectionGUID: 4mcIaIReT0Sujoqi3O75VQ==
X-CSE-MsgGUID: YQL4UxceTseJYDtPBwVyVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64429181"
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="64429181"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 01:50:37 -0800
X-CSE-ConnectionGUID: uzSkh+E1QHW4nIWcYnNOAA==
X-CSE-MsgGUID: yfE0iGB0TnO6fUV87FWs0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="193274361"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Nov 2025 01:50:33 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHfaZ-0000sZ-0W;
	Sat, 08 Nov 2025 09:50:31 +0000
Date: Sat, 8 Nov 2025 17:49:45 +0800
From: kernel test robot <lkp@intel.com>
To: Hrishabh Rajput via B4 Relay <devnull+hrishabh.rajput.oss.qualcomm.com@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/2] firmware: qcom: scm: Register gunyah watchdog
 device
Message-ID: <202511081706.0sVDjTBC-lkp@intel.com>
References: <20251107-gunyah_watchdog-v5-1-4c6e3fb6eb17@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-gunyah_watchdog-v5-1-4c6e3fb6eb17@oss.qualcomm.com>

Hi Hrishabh,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6146a0f1dfae5d37442a9ddcba012add260bceb0]

url:    https://github.com/intel-lab-lkp/linux/commits/Hrishabh-Rajput-via-B4-Relay/firmware-qcom-scm-Register-gunyah-watchdog-device/20251108-015559
base:   6146a0f1dfae5d37442a9ddcba012add260bceb0
patch link:    https://lore.kernel.org/r/20251107-gunyah_watchdog-v5-1-4c6e3fb6eb17%40oss.qualcomm.com
patch subject: [PATCH v5 1/2] firmware: qcom: scm: Register gunyah watchdog device
config: powerpc-randconfig-001-20251108 (https://download.01.org/0day-ci/archive/20251108/202511081706.0sVDjTBC-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511081706.0sVDjTBC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511081706.0sVDjTBC-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: powerpc-linux-ld: DWARF error: could not find abbrev number 44
   drivers/firmware/qcom/qcom_scm.o: in function `qcom_scm_probe':
>> qcom_scm.c:(.text+0x349c): undefined reference to `arm_smccc_hypervisor_has_uuid'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

