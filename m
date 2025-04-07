Return-Path: <linux-watchdog+bounces-3227-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCEEA7EF58
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Apr 2025 22:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA1B3169B1C
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Apr 2025 20:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5643821ABBC;
	Mon,  7 Apr 2025 20:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E3WLhrdk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F760217722;
	Mon,  7 Apr 2025 20:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744058180; cv=none; b=hFrDHBuesy+XnesdOl9xNrAfP96pwz/VR1ftqDqtnvXe1rEHXeUCDKfZHnGsSfCIcOhVRMzR1odU3qiLeH68+WPedBjMf/I4Wt3j59TZWWqc5asc2B9qkEBISbt0/F5yRdggMjJtkieXbkADwXXo1qfWr112S8hb5S9g2ihaoJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744058180; c=relaxed/simple;
	bh=SEFMHa645xj5XB05KG2bL79aOQHT4caCQ1V0FQwTMWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FjB+8YgnhaCdAyZWZxzjVuSlc7R/sJn4mEUyjXVO+7iacbeY26e3z2a53oh6DbQq2hZN/+M0TjyJ7Shr/Qt31Bwv/NXvX57ugjpJmDe8zSRO7p1coO6V8pEnlCu8QSgOrDclcW57pIjbxwv0lg2BywYjKcxtLdtjb6MMNLKYqys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E3WLhrdk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D501C4CEDD;
	Mon,  7 Apr 2025 20:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744058179;
	bh=SEFMHa645xj5XB05KG2bL79aOQHT4caCQ1V0FQwTMWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E3WLhrdkFlGOeuw9sCam0RR1lmnr9l1+8hk5Tyx+GhHeMhS9uwxhXnRDQSU7RZhwz
	 ajs+U3jhnqrzNI4wqt0/rCyH/ThWPWB7NJdioHW43Xhu2f/i/FVcgYUAoDeuLrv0XQ
	 7Xu5H/O6qwMZm99L3MbYBPOi48m1gsHoD6mkmAaYBSDN/AyY68x/EEjZPQZdwSx4i9
	 0ra2wsSQQ1ccvRFliHsg35rT9YFWFBrBKbNcuQPAxMBtpF++n8M/R5xuPKncKWaaeL
	 toIWrpa5JNZPQAgKJD81KRXwgiK3+CAP9d4Tf8NupTcDr0uKyj5wEk6iZyFTpNw6wL
	 POQLbX6eOrDSw==
Date: Mon, 7 Apr 2025 13:36:16 -0700
From: Kees Cook <kees@kernel.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Lukasz Majczak <lma@chromium.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2][next] watchdog: cros-ec: Avoid
 -Wflex-array-member-not-at-end warning
Message-ID: <202504071331.D9E4D6B058@keescook>
References: <Z-WG6_uhWsy_FCq3@kspp>
 <202504071212.D6CBE6740C@keescook>
 <e8114ca6-d092-482b-9d6b-db7ea1c15cbc@embeddedor.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8114ca6-d092-482b-9d6b-db7ea1c15cbc@embeddedor.com>

On Mon, Apr 07, 2025 at 01:42:07PM -0600, Gustavo A. R. Silva wrote:
> 
> > 
> > > +	msg->command = EC_CMD_HANG_DETECT;
> > > +	msg->insize  = (arg->req.command == EC_HANG_DETECT_CMD_GET_STATUS) ?
> > > +		   sizeof(struct ec_response_hang_detect) :
> > > +		   0;
> > > +	msg->outsize = sizeof(struct ec_params_hang_detect);
> > > +	*(struct ec_params_hang_detect *)msg->data = arg->req;
> > > +
> > > +	ret = cros_ec_cmd_xfer_status(cros_ec, msg);
> > >   	if (ret < 0)
> > >   		return ret;
> > > -	arg->resp = buf.data.resp;
> > > +	arg->resp = *(struct ec_response_hang_detect *)msg->data;
> > 
> > msg->data used twice and a "sizeof()" earlier... might be nicer to have
> > an explicit pointer?
> 
> Those are two different pointers:
> 
> *(struct ec_params_hang_detect *)msg->data = arg->req;
> arg->resp = *(struct ec_response_hang_detect *)msg->data;

Argh. I did it again. I can't see "params" vs "response". q_q

Sorry for the noise!

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

