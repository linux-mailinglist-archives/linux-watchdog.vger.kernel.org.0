Return-Path: <linux-watchdog+bounces-1963-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D21D97C836
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Sep 2024 12:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D3CB288182
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Sep 2024 10:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B1BD199E93;
	Thu, 19 Sep 2024 10:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="b4oIHAkH"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9C0194C8D;
	Thu, 19 Sep 2024 10:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726743015; cv=none; b=b/b/Tn9vYJVXe8FVXX9uPoSABBFNAND89eF2kmv/HCOJk23/P+Fy/2xX8nghRp+SI34wxkknQC8jGfBM9JqcOOyULjZZU04jxRUHO2YzDfHJ5x9zeed/JFmqViECoeVOTaA/UUU1C9QbF22ynavCyUbp/z0dr3PWbusELP+acGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726743015; c=relaxed/simple;
	bh=ANC+n21f2GuaGLTFK6/24yBgZWQqlsIzM4c66aDLVv8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l1g0+q2MBDWG9r12EKNIegJhim5lHPFZ4Hdb2IV5uHspNj8AI2OixRe0/KRH2PQJBjv3aqGQtgpGgVTN1/cqy991x9aExCy5lwdflWZ0j58ZrxY8s8DL8Es0fCrKc8ROgnVDvAuvO/x/7t3vERAK225Cu7+EPTZsN4ojpI4XG80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=b4oIHAkH; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=WmCTEFCRDJodWNyHvySC/ohhFDWXMpEjRr5eMc/klAo=; b=b4oIHAkHwoblkA1H178OeaPBLr
	l+ClD1EbvXQ6s4bYlS9WxL3AKUtur8z2IqvHtATveUmzfNSDW0um5DW/bRl/ujyMZExXHYMRJluua
	AM+LQ4SIMWLD9mzLlrO+T6NCu3Jo9jdPypWF0/Dsy4tDHesbMDKZUCbWfb3GWh1fhn1DGNna7hXMn
	M13xHjRCYp3LP/7Hst1YKF9Bi681WR7VoVD5s/AX0XOXYE6QmGT8bkFBuzYHO7XTExDI2wd+83L2r
	mggTMt8974plk8A3jI/8mxziRSbnN5jK/APFiVpRKCUL5pooeTV2Nm+qjTNU+KTLljbcvSvX8p1Sy
	FEIf4paQ==;
Date: Thu, 19 Sep 2024 12:50:05 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Guenter Roeck <linux@roeck-us.net>
Cc: wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] watchdog: rn5t618: use proper module tables
Message-ID: <20240919125005.0bcd17e4@akair>
In-Reply-To: <f52deaf1-492e-4cbe-8e46-8999ae2e481f@roeck-us.net>
References: <20240918212925.1191953-1-andreas@kemnade.info>
	<f52deaf1-492e-4cbe-8e46-8999ae2e481f@roeck-us.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Wed, 18 Sep 2024 15:43:40 -0700
schrieb Guenter Roeck <linux@roeck-us.net>:

> On 9/18/24 14:29, Andreas Kemnade wrote:
> > Avoid requiring MODULE_ALIASES by declaring proper device id tables.
> > 
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>  
> 
> This needs a better rationale. There are more than 40 watchdog drivers
> using MODULE_ALIAS. I would hate having to deal with 40+ patches just
> for cosmetic reasons, not counting the thousands of instances of
> MODULE_ALIAS in the kernel, including the more than 1,000 instances of
> "MODULE_ALIAS.*platform:".
>
basically reviewers were arguing against patches from me bringing in
MODULE_ALIASES. So I decided to clean up a bit in my backyard. Not
sure whether such things could by done by coccinelle but at least
it could be tested via output of modinfo.

This is one example for such a patch:
https://lore.kernel.org/linux-clk/119f56c8-5f38-eb48-7157-6033932f0430@linaro.org/

Citing Krzysztof:

> > Is there a general consensus that MODULE_ALIAS("platform:.*") should
> > be exorcised? Of course for this new driver I will avoid it now
> > anyways.

> Whether "general" I don't know, but I was removing it quite a lot in
>the
> past. I think I removed all at some point, now I guess we have them
> back :/.

> MODULE_ALIAS is not the correct way to solve module matching problem.
>ID
> table with the correct way. Alias is just a workaround which now
> works,
> but later might stop (e.g. ID table will come with additional
>features).

Regards,
Andreas

