Return-Path: <linux-watchdog+bounces-2094-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECD4991223
	for <lists+linux-watchdog@lfdr.de>; Sat,  5 Oct 2024 00:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D23041F23DA6
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 22:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2742147C86;
	Fri,  4 Oct 2024 22:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="aMgHdBkY"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B711A0708;
	Fri,  4 Oct 2024 22:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.147.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728079711; cv=none; b=RS1MxZrW6B5OCWlfbH1xZCZdfOfMTRvlMnO8HnHYPbit+BSn+dkPPbTb7NXJQh8r3nooEi/wSxZ4KL4TV/Z1hZ2QdRN5sCG639gTSX1xql1aZgHTDQQ2mIibG1Do5en3co/llEpygLWYUxZv4tj3HrfUOURV89OXneqcV/eOFgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728079711; c=relaxed/simple;
	bh=o9qU/A35l1Kot3wFtaUfmVaaenJHHKKZCK/gHpnoi7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B3962SWqk9bSyMMlRoB3xjyyxRsc3aNTod/7WpV1A/x9malH1jfipzdZSH8i9a/CaNmrV8lzHrG2iNB09kryW7+Z6f1jJsuzlJSxr9HKUOuMBJ0vHKc3NqCHmfPJycC06iWG09U+Eyf/QvA4dPpVhygxqk7HxDhCU6ZptYRYFWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=aMgHdBkY; arc=none smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Received: from pps.filterd (m0150241.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494HrI9C003959;
	Fri, 4 Oct 2024 21:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=date
	:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-type:in-reply-to; s=pps0720; bh=E9EPOTTowAxulKOGhHpOs4g
	ZL3GrZMfR31KCIwjIz7k=; b=aMgHdBkYHYdmrr4YKPN1CLfzRfVFSeilJ4b0UQ+
	iHI4cSmJl2U+hDvQbRR4MNzVc2Va7rSnmzzb28Ao1PV6k0QhtDLZImQ2Vm9fACsX
	JvfzAFC0TpV/XUxNmYW6UoBpcwdzwi84HY3cQqQ1TroBqNAOmLYHcc+gdx/ErFEo
	xXpKT/OFYw3cZGj+tLudU7NCRVSlHyzH9sHiQ3eC8qExe1GBs08GePlY5xUV7hY3
	uMape+XK+LeuqbjaC8ic0ZcRbkAg3J9Jou9OfULjR604kBRC2rT5IxJu5+mBME5V
	DhCYYcAGeT9pg2DWdhEAKpUIo7bEWiWxVrrsNvVte90r1SQ==
Received: from p1lg14878.it.hpe.com ([16.230.97.204])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 422n53h420-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 21:29:15 +0000 (GMT)
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id AC31914799;
	Fri,  4 Oct 2024 21:29:14 +0000 (UTC)
Received: from anatevka.ftc.rdlabs.hpecorp.net (unknown [16.231.227.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTPS id 6F6DA801620;
	Fri,  4 Oct 2024 21:29:10 +0000 (UTC)
Date: Fri, 4 Oct 2024 15:29:09 -0600
From: Jerry Hoemann <jerry.hoemann@hpe.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Jean-Marie Verdun <verdun@hpe.com>,
        Nick Hawkins <nick.hawkins@hpe.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Subject: Re: [RFC PATCH 3/9] watchdog: hpe-wdt: don't print out if
 registering watchdog fails
Message-ID: <ZwBeJUXqm3Tf0th_@anatevka.ftc.rdlabs.hpecorp.net>
Reply-To: Jerry.Hoemann@hpe.com
References: <20241004200314.5459-1-wsa+renesas@sang-engineering.com>
 <20241004200314.5459-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004200314.5459-4-wsa+renesas@sang-engineering.com>
X-Proofpoint-ORIG-GUID: jXaEx0KcMm_16CEQDy6C9lrCo3klNyMK
X-Proofpoint-GUID: jXaEx0KcMm_16CEQDy6C9lrCo3klNyMK
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-04_18,2024-10-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1011 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040148

On Fri, Oct 04, 2024 at 10:03:06PM +0200, Wolfram Sang wrote:
> The core will do this already.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/watchdog/gxp-wdt.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Question:  should email have been titled
	"watchdog: gxp-wdt: ..."
instead of
	"watchdog: hpe-wdt: ..."

to match the module name as the email title gets put into
the git log for the file?

Thanks

Jerry


> 
> diff --git a/drivers/watchdog/gxp-wdt.c b/drivers/watchdog/gxp-wdt.c
> index 2fd85be88278..f2c236160266 100644
> --- a/drivers/watchdog/gxp-wdt.c
> +++ b/drivers/watchdog/gxp-wdt.c
> @@ -151,10 +151,8 @@ static int gxp_wdt_probe(struct platform_device *pdev)
>  
>  	watchdog_stop_on_reboot(&drvdata->wdd);
>  	err = devm_watchdog_register_device(dev, &drvdata->wdd);
> -	if (err) {
> -		dev_err(dev, "Failed to register watchdog device");
> +	if (err)
>  		return err;
> -	}
>  
>  	dev_info(dev, "HPE GXP watchdog timer");
>  
> -- 
> 2.45.2
> 

-- 

-----------------------------------------------------------------------------
Jerry Hoemann                  Software Engineer   Hewlett Packard Enterprise
-----------------------------------------------------------------------------

