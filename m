Return-Path: <linux-watchdog+bounces-2365-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C229B3EB6
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2024 00:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA531282E86
	for <lists+linux-watchdog@lfdr.de>; Mon, 28 Oct 2024 23:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDDE51EF92F;
	Mon, 28 Oct 2024 23:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="CNA8hmve"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC541DFDB9;
	Mon, 28 Oct 2024 23:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730159738; cv=none; b=HyV6lWFa9pMudeAsQhqba3WQlMaiRgGBVi9wsk0bJj3u0qIiokhEG2tx/ecTdpBkaDRtnM/jDB2/3p6NZ2QcvoVyd3SGy5vT+uDk5dn67nSAiLrMFyBHhK5Ti6Fc6k0PDs7vlbrSywZyaPdt+atNWs2d+Bm66uWAOKDOZKQRPw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730159738; c=relaxed/simple;
	bh=bjqlL3P9HBN4voyP2L5yXiRhMBCYac+G+6cqIX9zAoQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dHd5aposqC4SiWh6jijHxAwCuyg0ybwxkAaaaV2lOcciFlaZmceu7YyPNov+fIxvi0q1KfLsTtQozc7u5PTygm8EqCUTE73vYcBf+ZMHaHOeMCvQepHrPPsb+BD5ItrApJF+Fmf0e1rkqEsb0CmGDWWNkt3dDiBZ4b9JVtdmuTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=CNA8hmve; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1730159732;
	bh=bjqlL3P9HBN4voyP2L5yXiRhMBCYac+G+6cqIX9zAoQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CNA8hmvef1s42GR010rD7RxBEzuLHnOSLEfuTT4ohExeXOUCtAQ3i+ii9BKdYKgKV
	 oo+ShgOBibYW+XnZbEV/vB+1TfNLRQXjyFJrz0LhuGlcgReHpnuvlFkW7MOxNEvdvd
	 ww1dmGu+0KI665WZPEqhRujOC1/thS7nO3Rjd+GF5ltVm7gahHiv7Iu4N/GsSAxdx2
	 l7lujEO43zAdpezhv6vA4WZmuVsYw2em11xjIbHBYTxBvLb6JIajA3ovfIYuJwq89Q
	 8yOFQNx3fu39RpTxjMjnWcvV1eDs6PkTYpfahkMeC4b4BbiELz9EC3tL/4My1i9pUT
	 ow3BSW4nRJKLw==
Received: from [192.168.68.112] (ppp118-210-190-243.adl-adc-lon-bras34.tpg.internode.on.net [118.210.190.243])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 91D4F67728;
	Tue, 29 Oct 2024 07:55:26 +0800 (AWST)
Message-ID: <0b51600b1308d64e362b771f1bf8adde2fa0fc19.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 1/3] ARM: dts: aspeed: Add WDT controller into alias
 field
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, patrick@stwcx.xyz, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	wim@linux-watchdog.org, linux@roeck-us.net, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc: Peter.Yin@quantatw.com, Patrick_NC_Lin@wiwynn.com, Bonnie_Lo@wiwynn.com,
  DELPHINE_CHIU@wiwynn.com, bmc-sw@aspeedtech.com,
 chnguyen@amperecomputing.com
Date: Tue, 29 Oct 2024 10:25:20 +1030
In-Reply-To: <20241028024813.2416962-2-chin-ting_kuo@aspeedtech.com>
References: <20241028024813.2416962-1-chin-ting_kuo@aspeedtech.com>
	 <20241028024813.2416962-2-chin-ting_kuo@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-10-28 at 10:48 +0800, Chin-Ting Kuo wrote:
> Add WDT controller into alias field. After that, WDT index,
> used to distinguish different WDT controllers in the driver,
> can be gotten by using of_alias_get_id dts API.

I feel it would be less brittle if we encode the mapping in the driver?
Based on reg the driver can derive the watchdog index. That way there's
no constraint on how the platform architect arranges the aliases for
the watchdogs (if they define them at all).

Andrew

