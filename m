Return-Path: <linux-watchdog+bounces-1888-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1572977BAB
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2024 10:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 176CD1C21416
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2024 08:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 743F41D67B4;
	Fri, 13 Sep 2024 08:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="CZkLeRj5"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917031714CD;
	Fri, 13 Sep 2024 08:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.125.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726217829; cv=none; b=htnyItOMAPZ7nNTkf8f4aDdmmXEqacTICW3ePRsjc27cBc43fqxD8d6XnZcxRD2nTYA33kj0Y1uIIV9MpXo8/3tcBd7OYwo0wPZiBwiSDhxad/VdUFhe9ehRWJXn2Z+LORBGf6FZczyyTy573cwDxEE3xJpNdyKPU+mMiQHBJU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726217829; c=relaxed/simple;
	bh=L2M5SuCNmipfKphPitsBa/R/HP6VsGtSLkdrj9Qb54g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f2pbmfgF9mTiDhlWzCERE10oofsRfigl85DrPPB9FK6mKrIp7HYuOVhQgewdYp1IQUXBmvNKAQIQk6IVM/cpwO6uVXYQ/EdUZ1/ZnfkOMw7Ze6tkwTTIFiHDjjFWe0GGnciysIytNoPZWtoDIySKBABeK4ZeHkltZQ1fkqQEytM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org; spf=pass smtp.mailfrom=linux-watchdog.org; dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b=CZkLeRj5; arc=none smtp.client-ip=185.87.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id AC2DA40A91; Fri, 13 Sep 2024 10:32:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org AC2DA40A91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20180602; t=1726216368;
	bh=L2M5SuCNmipfKphPitsBa/R/HP6VsGtSLkdrj9Qb54g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CZkLeRj5I+JHFdgwKfx2xPu0TUcICC6Av4mvTd0hJS56DR4LQWZMDzck27P7/+7TE
	 oL/n53T+wnOTPEfQ0Gt9rSxVBT9bHZzKLkFdQIRLBycCNkEnStRz39DHIQcOm47x/W
	 GhFrM0id0Rz/bzNH1cstMK0zvOjjZJnjsGa+kqTk=
Date: Fri, 13 Sep 2024 10:32:48 +0200
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, alice.guo@nxp.com,
	festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux@roeck-us.net,
	s.hauer@pengutronix.de, shawnguo@kernel.org, ye.li@nxp.com
Subject: Re: [PATCH v5 1/1] watchdog: imx7ulp_wdt: move post_rcs_wait into
 struct imx_wdt_hw_feature
Message-ID: <20240913083248.GB31440@www.linux-watchdog.org>
References: <20240730145610.2177627-1-Frank.Li@nxp.com>
 <ZtDvk02cvKCemYbN@lizhi-Precision-Tower-5810>
 <ZuCd0xTZ29meorYy@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZuCd0xTZ29meorYy@lizhi-Precision-Tower-5810>
User-Agent: Mutt/1.5.20 (2009-12-10)

Hi Frank,

> On Thu, Aug 29, 2024 at 06:00:51PM -0400, Frank Li wrote:
> > On Tue, Jul 30, 2024 at 10:56:10AM -0400, Frank Li wrote:
> > > Move post_rcs_wait into struct imx_wdt_hw_feature to simple code logic for
> > > difference compatible string.
> > >
> > > i.MX93 watchdog needn't wait 2.5 clocks after RCS is done. So needn't set
> > > post_rcs_wait.
> > >
> > > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > > Signed-off-by: Alice Guo <alice.guo@nxp.com>
> > > Reviewed-by: Ye Li <ye.li@nxp.com>
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> 
> Wim Van Sebroeck:
> 
> 	Could you please take care this patch?
> 

It's in Linux-watchdog-next since tuesday.

Kind regards,
Wim.


