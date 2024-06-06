Return-Path: <linux-watchdog+bounces-1106-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95ED88FF510
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Jun 2024 20:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC82B1C25091
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Jun 2024 18:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E70354F5FB;
	Thu,  6 Jun 2024 18:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qJi+R8wv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NZuoaFCW"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524131BC3C;
	Thu,  6 Jun 2024 18:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717700391; cv=none; b=imPcywcip1M3WQMVCtZqWe909cho6hzhdfwWxxp1qmrpKB9ERUzBFl29DQKRAVXQYSg6g7d2EwQE4pMGPYgbd9SLPwCA8si9C0gAgaTU8fRidu4A2JCNadmBGuAvgR7dUANZjmAuKyANEiljQ6U3JSvYmfgzdey90lt3A8jkqw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717700391; c=relaxed/simple;
	bh=PBQlux8vvLo0Z0BGhEJHALFedNirUWBPON8FKluAEi4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KRiFbWUB98+MBv+PaXDU9tK0YJOOaxeZsgaNy4LaJSzNArfbhIhQWKeZUDicqy9gma2AA8xZQonkhGt70JVhZCxr+rz4WbrVP+q6IamrLrISRwEX+XWreBB2tAsVLPWJ8mqeWgYGY7PUBCc+4ib1Mt9TOUAkJYEXqBB98KfJH5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qJi+R8wv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NZuoaFCW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1717700388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h2T0DbAUrrKT9ttONGR5TRLMSSgb9Rr8VNZEBbJLs/w=;
	b=qJi+R8wvfyokvEVu1Cl/Od8jkeXDw5uvpcyTPmN+FcBBm1O6CCsm/AqRssvMXQ4dxgKzsK
	0sgVPC4rog6n7YSMRfQ7FvhPgz5pNXp4XzzV89Rf4HS8AB7SiCT2veA11f6vv926JGTuzh
	tFhgAtFeozzDGMb1pqF0wD4EJegwqOlUhD98v7//h+TJTXkorNTgjE7VuI7itFvJu2uRFv
	lG2RvMsMBFr40s/EpyTJ+1VnAG6T/SzMnihoWTdvECoHPGRdPuKXQUwtzzLTKhsd0tpe+u
	KRGVdG4D2tV0YBpsbe+Suug8VTDyGJ018GknZ0oTxUi/H7BzcTxVr+NiESHDIg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1717700388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h2T0DbAUrrKT9ttONGR5TRLMSSgb9Rr8VNZEBbJLs/w=;
	b=NZuoaFCW1bXqXaEoiXWONbX88yFJvCwxT7Ryn74knGA5myyU5InuJkHDJYiybDd8AoGvdp
	AKGUVN3kwEnlmdBg==
To: Matti Vaittinen <mazziesaccount@gmail.com>, Matti Vaittinen
 <mazziesaccount@gmail.com>, Matti Vaittinen
 <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Matti Vaittinen
 <mazziesaccount@gmail.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, Herve Codina
 <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 07/10] irqdomain: Allow giving name suffix for domain
In-Reply-To: <bbd219c95f4fe88752aee5f21232480fe9b949fb.1717486682.git.mazziesaccount@gmail.com>
References: <cover.1717486682.git.mazziesaccount@gmail.com>
 <bbd219c95f4fe88752aee5f21232480fe9b949fb.1717486682.git.mazziesaccount@gmail.com>
Date: Thu, 06 Jun 2024 20:59:47 +0200
Message-ID: <87plst28yk.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Matti!

On Tue, Jun 04 2024 at 10:55, Matti Vaittinen wrote:
>  struct irq_domain *__irq_domain_add(struct fwnode_handle *fwnode, unsigned int size,
>  				    irq_hw_number_t hwirq_max, int direct_max,
>  				    const struct irq_domain_ops *ops,
> -				    void *host_data);
> +				    void *host_data, const char *name_suffix);
>  struct irq_domain *irq_domain_create_simple(struct fwnode_handle *fwnode,
>  					    unsigned int size,
>  					    unsigned int first_irq,
> @@ -350,7 +350,8 @@ static inline struct irq_domain *irq_domain_add_linear(struct device_node *of_no
>  					 const struct irq_domain_ops *ops,
>  					 void *host_data)
>  {
> -	return __irq_domain_add(of_node_to_fwnode(of_node), size, size, 0, ops, host_data);
> +	return __irq_domain_add(of_node_to_fwnode(of_node), size, size, 0, ops,
> +				host_data, NULL);

....

Looking at the resulting amount of churn to add that argument, I'm not
really enthused. There is some other unrelated change required in this
area:

  https://lore.kernel.org/all/8734pr5yq1.ffs@tglx

My suggestion to convert all of this mess into a template based
mechanism would nicely solve your problem too.

Can you please have a look and eventually team up with Herve (CC'ed) to
sort this out? I'm happy to help and give guidance.

Thanks,

        tglx

