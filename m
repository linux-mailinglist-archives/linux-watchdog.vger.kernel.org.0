Return-Path: <linux-watchdog+bounces-4821-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA7AD284F4
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Jan 2026 21:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D98B300A3FB
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Jan 2026 20:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD96931ED7A;
	Thu, 15 Jan 2026 20:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mOsCR2ZU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA8B310762;
	Thu, 15 Jan 2026 20:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768507633; cv=none; b=PTbwktm5Dsgtmw1CfxekDxZHNNuIIAwza4HjDsJGjrbHLwms8qq9kOR1mCqtzhQHNq0WoiQKqpxI3qg8j/n0aMQeI1ylzPOqIX6ormztIqPpB9qCjxDYZajvehRxiGFnnge+ffprp13+R5DKlvlTEFDX6Ox4i3/sf0voo6IhRBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768507633; c=relaxed/simple;
	bh=AQfvwzmGUBkkXUXjJnK6h8dwu1OWTx6cCBdi7caD6Qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MoaJXNR834wfIo2cG0HIEPNZ1kUDbcMIzU+fgkCYAzV4SHHlaThSt/Ic9fPLn/9zezvmE0kOYDCMws0d/qYTNX3j59VNnEGyzUzKUar3GUTNSl0oIf5P8U8UtYaZJk3Nsw+ISHqSOmVrnhmzhupIgavQwBFLwYzQtpBNlbLLcGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mOsCR2ZU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 377B9C116D0;
	Thu, 15 Jan 2026 20:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768507633;
	bh=AQfvwzmGUBkkXUXjJnK6h8dwu1OWTx6cCBdi7caD6Qc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mOsCR2ZUuD4CHhKsY9ZgjXKujOeYxKEALHxGb5A3Wlf8HVt3HEmOykFg6OUpR5l3A
	 CMeAaA/8zUBqNT5JPFu8mKEyhmS0D03IUMVEiVgSDINJxXziP0P+aTDyrJI1Kz/Yz/
	 DTP8PK8gan9AwIygsfd/W4+3cdw4wbgmupW/jk323QtrhccGgGiE3qD4V2NXq1yD5H
	 0FjWzPxKlLy/ubo0Aw9dtvEU/0Qqm+KlvEpfDscTnI7yrawhFXMib37y0jmfaQLTut
	 Nw9vtzGjT2gSObmVvtwojWDu8hRPxqyajWkxB1eq0PrmfSWbfxXmILrBIbYKeE8Ybm
	 EO5YBmepqKm/A==
Date: Thu, 15 Jan 2026 14:07:12 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: CL Wang <cl634@andestech.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, tim609@andestech.com,
	linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
	linux@roeck-us.net
Subject: Re: [PATCH V2 1/3] dt-bindings: watchdog: Add support for Andes
 ATCWDT200
Message-ID: <176850763136.1100313.4056997529955864589.robh@kernel.org>
References: <20260115081444.2452357-1-cl634@andestech.com>
 <20260115081444.2452357-2-cl634@andestech.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115081444.2452357-2-cl634@andestech.com>


On Thu, 15 Jan 2026 16:14:42 +0800, CL Wang wrote:
> Add the devicetree binding documentation for the Andes ATCWDT200
> watchdog timer.
> 
> ATCWDT200 is the IP name, which is embedded in AndesCore-based
> platforms or SoCs such as AE350 and Qilai.
> 
> Signed-off-by: CL Wang <cl634@andestech.com>
> ---
> Changes in v2:
>   - Drop redundant text "including supported properties..." from the
>     commit message.
>   - Clarify the relationship between ATCWDT200 IP and SoCs (AE350/Qilai)
>     in the commit message.
>   - Add missing type definition ($ref: uint32), enum constraint, and
>     description for 'andestech,clock-source' property.
> 
> ---
>  .../watchdog/andestech,ae350-wdt.yaml         | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/andestech,ae350-wdt.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


