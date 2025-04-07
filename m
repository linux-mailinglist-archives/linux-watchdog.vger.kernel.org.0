Return-Path: <linux-watchdog+bounces-3225-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 283ECA7ED0E
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Apr 2025 21:29:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AB53420128
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Apr 2025 19:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C059721B18A;
	Mon,  7 Apr 2025 19:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SrW0nBUq"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916E41C36;
	Mon,  7 Apr 2025 19:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744053215; cv=none; b=st/mFW47rCSC9sIsATIDHMKyw9W8hMdLHVmwvUABSps7UxwLucVc9FKbKz7gu1VSSdExYZpJJDrQcOSjDg0qcGAhMR2fi8lEfuV2zzUOjywZ7anlCmjnP3tniUx7tWaW+46Ce1M+fEvMUvVhNGqGrgv9ufdfke49udcBx1N7WE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744053215; c=relaxed/simple;
	bh=zSXUnq/gy4D1tAup5XiKadhVrI1TzyvTfcOHNWLlO8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sUwe/iw9DvH2j9e+4i7WH0D8jtuWMsdeaYprcSASnhmQmaOVyUFJSeYHwXtFvHNYVdnKZeXJSjV5kx8DudhTBI39DgU9OatkaLfv3Oja8Up+zTYcdX6F859C91KnkjZwuazLiOyhzUuudEcfxJMjJvZoIDzNMlaupryI3jIAVr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SrW0nBUq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 689DAC4CEDD;
	Mon,  7 Apr 2025 19:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744053215;
	bh=zSXUnq/gy4D1tAup5XiKadhVrI1TzyvTfcOHNWLlO8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SrW0nBUqZWVFeSdOGJ807GvZZJ7NE9vMoiEYbDztJtPmDoLsSYGjFAQTTv1HIzH3D
	 QNEX6YWv8qpLURRliNhvv/L7SKU/7xydYTkTzgTGijxvKWs9kerLQP+yPGMDB+wxB/
	 n/EqrFFFZ2DP5PxgbWpwIAEMNhZtq73Q3l3gufYLmDRQRKT0wzwje8IdynXjiprzN+
	 bbrZKgI9DWooCtR/F4VQEIxANWJEB4QC1kpNIR9Nj3Ptvhv8SrPMpeqIJo/4m2VVke
	 Ea2Twog7kje3VmFhz3KDuU8G/UIeUiZorTvNdU1Md5UNhbENIifo4L/3gq0pz9g/zw
	 KEPbdbXizBTxg==
Date: Mon, 7 Apr 2025 12:13:32 -0700
From: Kees Cook <kees@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Lukasz Majczak <lma@chromium.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2][next] watchdog: cros-ec: Avoid
 -Wflex-array-member-not-at-end warning
Message-ID: <202504071212.D6CBE6740C@keescook>
References: <Z-WG6_uhWsy_FCq3@kspp>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-WG6_uhWsy_FCq3@kspp>

On Thu, Mar 27, 2025 at 11:12:11AM -0600, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Use the `DEFINE_RAW_FLEX()` helper for on-stack definitions of
> a flexible structure where the size of the flexible-array member
> is known at compile-time, and refactor the rest of the code,
> accordingly.
> 
> So, with these changes, fix the following warning:
> 
> drivers/watchdog/cros_ec_wdt.c:29:40: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
> Changes v2:
>  - Fix truncated line in changelog text. (Tzung-Bi)
>  - Update variable name: s/buf/msg (Tzung-Bi)
>  - Cast to structs instead of union. (Tzung-Bi)
>  - Add RB tag.
> 
> v1:
>  - Link: https://lore.kernel.org/linux-hardening/Z-SBITmMfwjocYwL@kspp/
> 
>  drivers/watchdog/cros_ec_wdt.c | 30 +++++++++++++-----------------
>  1 file changed, 13 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/watchdog/cros_ec_wdt.c b/drivers/watchdog/cros_ec_wdt.c
> index 716c23f4388c..9ffe7f505645 100644
> --- a/drivers/watchdog/cros_ec_wdt.c
> +++ b/drivers/watchdog/cros_ec_wdt.c
> @@ -25,26 +25,22 @@ static int cros_ec_wdt_send_cmd(struct cros_ec_device *cros_ec,
>  				union cros_ec_wdt_data *arg)
>  {
>  	int ret;
> -	struct {
> -		struct cros_ec_command msg;
> -		union cros_ec_wdt_data data;
> -	} __packed buf = {
> -		.msg = {
> -			.version = 0,
> -			.command = EC_CMD_HANG_DETECT,
> -			.insize  = (arg->req.command == EC_HANG_DETECT_CMD_GET_STATUS) ?
> -				   sizeof(struct ec_response_hang_detect) :
> -				   0,
> -			.outsize = sizeof(struct ec_params_hang_detect),
> -		},
> -		.data.req = arg->req
> -	};
> -
> -	ret = cros_ec_cmd_xfer_status(cros_ec, &buf.msg);
> +	DEFINE_RAW_FLEX(struct cros_ec_command, msg, data,
> +			sizeof(union cros_ec_wdt_data));
> +
> +	msg->version = 0;

Technically redundant, but it was redundant before, so keeping style is
okay.

> +	msg->command = EC_CMD_HANG_DETECT;
> +	msg->insize  = (arg->req.command == EC_HANG_DETECT_CMD_GET_STATUS) ?
> +		   sizeof(struct ec_response_hang_detect) :
> +		   0;
> +	msg->outsize = sizeof(struct ec_params_hang_detect);
> +	*(struct ec_params_hang_detect *)msg->data = arg->req;
> +
> +	ret = cros_ec_cmd_xfer_status(cros_ec, msg);
>  	if (ret < 0)
>  		return ret;
>  
> -	arg->resp = buf.data.resp;
> +	arg->resp = *(struct ec_response_hang_detect *)msg->data;

msg->data used twice and a "sizeof()" earlier... might be nicer to have
an explicit pointer?

-Kees

>  
>  	return 0;
>  }
> -- 
> 2.43.0
> 

-- 
Kees Cook

