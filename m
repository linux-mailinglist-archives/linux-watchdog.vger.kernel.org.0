Return-Path: <linux-watchdog+bounces-3760-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 00746AEC1F7
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Jun 2025 23:23:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37E7A7B7303
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Jun 2025 21:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67B22727EE;
	Fri, 27 Jun 2025 21:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cktOtafC"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85B6271461;
	Fri, 27 Jun 2025 21:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751059393; cv=none; b=WYdJI1+geHQeDdAQk/P8vq+R8AwcYPNFGejOWl5y6tmCjS7eIkTiIxRcb6IKTNPlhWUr8kx2E1eQ6tAAmTUvVQY0n47quJEdZrkLz7+p8r8BP9km8fZxpXMTFc49GxkOnnNS/Aw0MHpVhIrmZwlBQur2dN3Bn4XDAhwcIx2YzNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751059393; c=relaxed/simple;
	bh=LbfWVnsWMkOzpzcKvRL8GuxUnXtOZ8NVkjhS5qBLnno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jp99sId3VXjUKjuD/EQRK7+ZfOa7Xcot03amkGVzUgMywcgVSbhJgG6Ct9Lj8JDu4ttL2knBHzKgN2OtbjWysp/9cGt9x2VS+eUMlxRn6hIjDr9QpBUT9ZSvcrC4iEt3XSsUHCVW+Z2BF+zBfQmYIbxLwXBtl6s3seUm7gq5iEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cktOtafC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27CFBC4CEE3;
	Fri, 27 Jun 2025 21:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751059393;
	bh=LbfWVnsWMkOzpzcKvRL8GuxUnXtOZ8NVkjhS5qBLnno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cktOtafC6PR+kDVsCY0nZXwxhcwERjS0ucz1mkc8FKlzqBc7tq515FhJZQFvqK1bE
	 IiMPsKFUnfmbA+XJC5G9JMofV+rv6Sqdx3l3MVUYzLMAWbM6Erya2xKG83+EnMt7Qb
	 DVYC7CP81hdXMgFLsUPXiCZgpipZbc0jymAAjj298cqvN70gVwwWKXOY3G+T3dBoxA
	 dZpM0EcgCbW4d+hkvXv0I+dqZB9ox1+C0l8bteVLi8PzVHimG3uw+6uzIp9iy3e9pB
	 gCOMM+4QKLjzeBtXej2+LvmAVa0dKoyt4xSrA6roSh4QPw/klPv6QBmQMtVwx/xm+8
	 +j2qOzujjmi9w==
Date: Fri, 27 Jun 2025 16:23:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Max Shevchenko <wctrl@proton.me>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-serial@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 05/11] dt-bindings: vendor-prefixes: add JTY
Message-ID: <175105939209.166738.15034897899907823763.robh@kernel.org>
References: <20250626-mt6572-v2-0-f7f842196986@proton.me>
 <20250626-mt6572-v2-5-f7f842196986@proton.me>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626-mt6572-v2-5-f7f842196986@proton.me>


On Thu, 26 Jun 2025 11:53:58 +0300, Max Shevchenko wrote:
> JTY produced low-cost Android tablets based on various
> MediaTek MT65xx SoCs.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Max Shevchenko <wctrl@proton.me>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


