Return-Path: <linux-watchdog+bounces-3589-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA09AC7203
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 May 2025 22:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5AA03B6045
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 May 2025 20:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19161220F24;
	Wed, 28 May 2025 20:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="z9Kpv6+0"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA482206A7;
	Wed, 28 May 2025 20:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.125.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748463041; cv=none; b=Fmx1spu4g4H90HY/6PT2k5EcCVIp2UT263TBvSKte4v5I+PzoBpUF6yPl4BtW+7gFABFr/AU217W4CLc5qQLjQ08Bd9aoCeWR+mSjF4dGvdxifhOWoK6monMRxA6ogM23A07HIVLVUgXBKMNxyMe3exPNzOuaTojfcunB02B6Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748463041; c=relaxed/simple;
	bh=75JKcaE3gPt4gA1Koo8W9hqsCToTwcF3NPIS9IYS+RU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WS3I2juA9hY3t5WdK/tWRavkD0BmvHXiewKc0l2V3MUkihT5uZrHA3rpHZ+IW8i9G/3gqHQhiSnXhZKC8PQKuPfBIHPTa6dlOCUNSGrD4ZpAA4TG/p0PSLfMdZ3fCamnhefuIDJ7ZAh14X5+OIPLnSgWNxKqjiNCm2rjdXJRLxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org; spf=pass smtp.mailfrom=linux-watchdog.org; dkim=pass (2048-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b=z9Kpv6+0; arc=none smtp.client-ip=185.87.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id D2A19409F8; Wed, 28 May 2025 21:24:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org D2A19409F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20250313; t=1748460290;
	bh=75JKcaE3gPt4gA1Koo8W9hqsCToTwcF3NPIS9IYS+RU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=z9Kpv6+0ky7XFWEAljuOrbSqY020gRgP1pofUrSI0LZhqsIOpecd/cytCy+KV5hbs
	 96c5dLUmQummtZ5wyDGamV3PM6Dkuz/O30yr9y0ftrBu1vEow+HBf7E1d7oJTZB6cL
	 DT2blBoDok09DonG6D22GOhrKApWLbz7aidAxW7YzjS/ltcnl2jzetM2lvR6Vegx/S
	 +2nH7XIJk6koHAiaBRjFADkQzrlRJqVSCqGgGXp2l3p6F/3lnSKUGqFmKYlwmP71UY
	 GAaa4Jv48yL4T8GeNylLiAfg+uA7iTOBBYmH3CeuIXIPUaIVQIG5ieXq8KHVSQvDaE
	 iQFSuhCgd1nQQ==
Date: Wed, 28 May 2025 21:24:50 +0200
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>, wim@linux-watchdog.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	S32@nxp.com, ghennadi.procopciuc@nxp.com, thomas.fossati@linaro.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, alexandru-catalin.ionita@nxp.com
Subject: Re: [PATCH v4 0/2] Add the NXP S32 Watchdog
Message-ID: <20250528192450.GA15816@www.linux-watchdog.org>
References: <20250410082616.1855860-1-daniel.lezcano@linaro.org>
 <650c336b-a698-42f5-ad59-7dcdf24667f4@linaro.org>
 <2a8e1ae7-2a8a-4cd8-b699-c010019c766e@roeck-us.net>
 <a6d64948-e713-4a50-9d4e-6de02a550d06@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6d64948-e713-4a50-9d4e-6de02a550d06@linaro.org>
User-Agent: Mutt/1.5.20 (2009-12-10)

Hi Daniel,

> Hi Guenter, Wim,
> 
> On 14/05/2025 20:09, Guenter Roeck wrote:
> 
> [ ... ]
> 
> >AFAICS the patches do have Reviewed-by: tags, so this is just
> >waiting for Wim
> >to pick it up.
> 
> I fetched the watchdog tree and saw it was updated from May 23th but
> I don't see this watchdog series.
> 
> Is it possible to give a status about it ?

commit bd3f54ec559b554671e5a683e05794abe3a609df
Author: Daniel Lezcano <daniel.lezcano@linaro.org>
Date:   Thu Apr 10 10:26:14 2025 +0200

    watchdog: Add the Watchdog Timer for the NXP S32 platform


It's in linux-watchdog-next since the 24th.
It will be sent to Linus probably this weekend.

Kind regards,
Wim.


