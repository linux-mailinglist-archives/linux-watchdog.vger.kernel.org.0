Return-Path: <linux-watchdog+bounces-3308-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C20AA8ACA5
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Apr 2025 02:24:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB1513B8B4F
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Apr 2025 00:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB3171A08BC;
	Wed, 16 Apr 2025 00:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="auf6czB4"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7B314885B
	for <linux-watchdog@vger.kernel.org>; Wed, 16 Apr 2025 00:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744763065; cv=none; b=QWwHeFTMESIMO4XSKkVQVFBFNqAOaVM+x3CXESTzVwpzcyQo5V23bwgcW1APbC4ISYB5PrL+iKn4GT+Ey14GHdiPukSvQV4rWvyYWeYKgWQkm4E6L4X882emWedeL4rzHjuy0lTq+n90qZjrx/T7hSpmQi/vq7JNhLDgtmWpHmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744763065; c=relaxed/simple;
	bh=nbjGo7o5PVE0LSyUGasinTe0CBH2iFAB776bGOj05Hs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EXyDg5ImlPOd+Y5eHOW72Npei/PMFBXwEndodwPvsZAh+lqp18v2s+5qGME1E4+wTdDDxodsHv+GQpewEad5/EARuTnYt0Ci1lkiWGDiEULKjjXihDKwEg0hRn/8Pht8GLIwqaTOXYBgM8WggmfMJ5Bwrh++VeWJlmqsO4iNcWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=auf6czB4; arc=none smtp.client-ip=44.202.169.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Received: from eig-obgw-5004a.ext.cloudfilter.net ([10.0.29.221])
	by cmsmtp with ESMTPS
	id 4qCEuyHQ6zZPa4qZcu2BWG; Wed, 16 Apr 2025 00:24:16 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 4qZbuResojrgq4qZcusWkG; Wed, 16 Apr 2025 00:24:16 +0000
X-Authority-Analysis: v=2.4 cv=PK7E+uqC c=1 sm=1 tr=0 ts=67fef8b0
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=B3fuDwYyW55wTQKIj88FGw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=7T7KSl7uo7wA:10 a=VwQbUJbxAAAA:8
 a=9MnfFl-tLoddl8rzticA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Xt_RvD8W3m28Mn_h3AK8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=K7mFB8T9aqNCzoiArbNncglumRxV8ThsIT1sO4XwnZI=; b=auf6czB4jCDJ0Utts0EfkNZjBB
	Wc6bFsG7+UjGMXYoeQ9WXOcciJsZXRQKfUXhT78ikxbjHHYhWlaC8aPoCus/X88wSso4A6GSkU6rF
	eDMq6gQE9bUorN8vLTVRcIQykWAqfdWeJv7MrBgFV0GEo5+dvpiB3rd+3mUYX4NOFZ5hNfnubM1fj
	Plx9c/372HD2XdAjffU03VQx4zW9+imaYb44dziKCb2gX0JS4G/vBxpYzEl5hBuKxFRM2zLoh04wt
	Gw0uLEUrTRxUc7TAmJJyYzEcsfjqr+LR2ENgHlYtPHS4TwHdyYaqPY4z5Zn1/+neZvxK4GtNSiDw7
	F1VPN6Rw==;
Received: from [201.172.174.147] (port=38092 helo=[192.168.15.14])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1u4qZa-000000018Te-3og3;
	Tue, 15 Apr 2025 19:24:14 -0500
Message-ID: <78711464-250d-4c1a-8635-cc8993dfee10@embeddedor.com>
Date: Tue, 15 Apr 2025 18:24:12 -0600
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2][next] watchdog: cros-ec: Avoid
 -Wflex-array-member-not-at-end warning
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Lukasz Majczak <lma@chromium.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: chrome-platform@lists.linux.dev, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 Kees Cook <keescook@chromium.org>
References: <Z-WG6_uhWsy_FCq3@kspp>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <Z-WG6_uhWsy_FCq3@kspp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.172.174.147
X-Source-L: No
X-Exim-ID: 1u4qZa-000000018Te-3og3
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.14]) [201.172.174.147]:38092
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 12
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDiDaz7y/B7Bi1ujL1ow94h3GSZme1veW7sg2ogNOyeZy6oH+QYr2vkRNEKk5QiyYK+j13VD4cBSsqAfwXEfx8fqrTmCGraeGfxffFMat7m+/B+eJQFF
 vko2e5uvkQrZuwql3ShliVbavr+liQY8oYagwYnKRnC19WAGIhLEfQRKbY3mGeGEGplNiUb7jhVeAq0sCAPetMvH/B8rZmoYLE1Yy37P1ma3rvOwHgVJI09O

Hi all,

Friendly ping: who can take this patch, please? 🙂

Thanks!
-Gustavo

On 27/03/25 11:12, Gustavo A. R. Silva wrote:
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
>   - Fix truncated line in changelog text. (Tzung-Bi)
>   - Update variable name: s/buf/msg (Tzung-Bi)
>   - Cast to structs instead of union. (Tzung-Bi)
>   - Add RB tag.
> 
> v1:
>   - Link: https://lore.kernel.org/linux-hardening/Z-SBITmMfwjocYwL@kspp/
> 
>   drivers/watchdog/cros_ec_wdt.c | 30 +++++++++++++-----------------
>   1 file changed, 13 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/watchdog/cros_ec_wdt.c b/drivers/watchdog/cros_ec_wdt.c
> index 716c23f4388c..9ffe7f505645 100644
> --- a/drivers/watchdog/cros_ec_wdt.c
> +++ b/drivers/watchdog/cros_ec_wdt.c
> @@ -25,26 +25,22 @@ static int cros_ec_wdt_send_cmd(struct cros_ec_device *cros_ec,
>   				union cros_ec_wdt_data *arg)
>   {
>   	int ret;
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
> +	msg->command = EC_CMD_HANG_DETECT;
> +	msg->insize  = (arg->req.command == EC_HANG_DETECT_CMD_GET_STATUS) ?
> +		   sizeof(struct ec_response_hang_detect) :
> +		   0;
> +	msg->outsize = sizeof(struct ec_params_hang_detect);
> +	*(struct ec_params_hang_detect *)msg->data = arg->req;
> +
> +	ret = cros_ec_cmd_xfer_status(cros_ec, msg);
>   	if (ret < 0)
>   		return ret;
>   
> -	arg->resp = buf.data.resp;
> +	arg->resp = *(struct ec_response_hang_detect *)msg->data;
>   
>   	return 0;
>   }


