Return-Path: <linux-watchdog+bounces-2182-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEF6998FD5
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 20:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 072BC1C22FE7
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 18:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE63A1CCB2A;
	Thu, 10 Oct 2024 18:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W09yPTrs"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892B21C9B93;
	Thu, 10 Oct 2024 18:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584664; cv=none; b=CQeWpu6qeSfhkIgmi0XyYLOGeRAisbwBAa4P/Svtv1J7tesyQsQ5Tk45+RQhU9zetUAMERJrzAAE5FoJUQiQax2+BaiWgBi0DMgqSV34VjwA+aS/IbDB4Ia4JCWrhwi/CXyZ/g4+34lW8yPEIyEe6XMH8PWnMi0Wws6eUzVLBQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584664; c=relaxed/simple;
	bh=LXWRpUCFEW0Rx04S04rSJW8bkwD7Sr+8cSNN1CAscBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qcV1fSgegJeLCN00Dv8fFGIYF70nbynNXqE6rGAAR1qjofii5RHQxdZZC8oc9rhKVIVJCXDJj5RafoQPZNZw/veNgRcL7Di3N87fvyqHw9EeG59QrdgiI8V55K5HA8nfG6P64YymTBTFFbhK+QswjOZxAO38vL8OTzbN+/jbyIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W09yPTrs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C9EFC4CEC5;
	Thu, 10 Oct 2024 18:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728584664;
	bh=LXWRpUCFEW0Rx04S04rSJW8bkwD7Sr+8cSNN1CAscBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W09yPTrsAR0lHYNUF/tBo+WwwUzmSF3X/IPDGqlWqiO7J5dM9dmuHlI8bv8C30/NJ
	 W3wRi4K5Y4dEfXG7JJQgL5s91rSZtBQM/xooGHy6CLEVXDJudAeToRi0/2LSU9A/Ym
	 zyTJYO55nf/irDzKi+8GceKbR5rmjS1+ziMG+Ymr9dgRSKWpdwN3uuiLlAYjnr9TGb
	 WNzqgARb+3h8JGXwcQt7nceDb7BMKPSrXXch7fIZi/SPu3tZcR0YIS2aKY/8nN3tcb
	 RhRuFtxc+PshCMxIAif3BUwwY6nlO3CtGk0G2K7PDOURkcNJQ8JMaeycZG3PZT68HN
	 P9CtfTVDaWkrQ==
Date: Thu, 10 Oct 2024 13:24:23 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-watchdog@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-leds@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	Jingoo Han <jingoohan1@gmail.com>, linux-input@vger.kernel.org,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: input: convert
 zii,rave-sp-pwrbutton.txt to yaml
Message-ID: <172858466263.2206934.3878201862515578388.robh@kernel.org>
References: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
 <20241010-zii_yaml-v2-1-0ab730607422@nxp.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-zii_yaml-v2-1-0ab730607422@nxp.com>


On Thu, 10 Oct 2024 11:42:38 -0400, Frank Li wrote:
> Convert device tree binding doc zii,rave-sp-pwrbutton.txt to yaml format.
> Additional changes:
> - add ref to input.yaml.
> - remove mfd node in example.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/input/zii,rave-sp-pwrbutton.txt       | 22 -------------
>  .../bindings/input/zii,rave-sp-pwrbutton.yaml      | 36 ++++++++++++++++++++++
>  2 files changed, 36 insertions(+), 22 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


