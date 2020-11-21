Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA822BC1AF
	for <lists+linux-watchdog@lfdr.de>; Sat, 21 Nov 2020 20:11:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728186AbgKUTLF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 21 Nov 2020 14:11:05 -0500
Received: from gproxy7-pub.mail.unifiedlayer.com ([70.40.196.235]:38394 "EHLO
        gproxy7-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728088AbgKUTLE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 21 Nov 2020 14:11:04 -0500
X-Greylist: delayed 1272 seconds by postgrey-1.27 at vger.kernel.org; Sat, 21 Nov 2020 14:11:04 EST
Received: from cmgw15.unifiedlayer.com (unknown [10.9.0.15])
        by gproxy7.mail.unifiedlayer.com (Postfix) with ESMTP id B4BF8215C31
        for <linux-watchdog@vger.kernel.org>; Sat, 21 Nov 2020 11:49:52 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id gXxIkBWEOh41lgXxIkFuPW; Sat, 21 Nov 2020 11:49:52 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=FoUrAVjq c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=nNwsprhYR40A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=iH7RfIX4AAAA:20
 a=VwQbUJbxAAAA:8 a=_jlGtV7tAAAA:8 a=HOh39_7OrIoUAtzd_H4A:9
 a=CjuIK1q_8ugA:10:nop_charset_2 a=AjGcO6oz07-iQ99wixmX:22
 a=nlm17XC03S6CtCLSeiRr:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Ma9SNEJKRKcEL3w9mUf3WVZyKUvisTLK9xTFAPqR6yE=; b=zOvCV+omlDOOeljNgIHaQlZmfB
        l7npLiH9HBCVd5xY1R0U+EH8qeHQMquj0NUpSYFTZIA8VLn+7a21T/x+6jJHnJXW4YyRS38hGoaXs
        56c9MQYanFKI1dwLXPYMlK/vHFvpOw53epzVF14PVrlk8Ns3cUbmjwiIdc+OMS7TRTogyZfXfcrF3
        mjNB7ixyYXBF5qbQzMFdqcHILQWSxajwc69SSLJOSOo5jottummp+1g46bmoP2oDG8XbwUdjwe271
        0Y2zbcN1oovUkdcXlSw+cO2dh0v+UPopHLRp4/MwM1VgLAX7sGzVtmUo+oaOLVtmMfktCMrwPyVMt
        q5Mhzl2Q==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:40988 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kgXxH-003CPv-QN; Sat, 21 Nov 2020 18:49:51 +0000
Date:   Sat, 21 Nov 2020 10:49:51 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH 057/141] watchdog: Fix fall-through warnings for Clang
Message-ID: <20201121184951.GA114144@roeck-us.net>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <713aa26be06d50dd3bb582a3cb71f04787ad5d5b.1605896059.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <713aa26be06d50dd3bb582a3cb71f04787ad5d5b.1605896059.git.gustavoars@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kgXxH-003CPv-QN
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:40988
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 57
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Nov 20, 2020 at 12:32:51PM -0600, Gustavo A. R. Silva wrote:
> In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
> by explicitly adding a fallthrough pseudo-keyword instead of letting the
> code fall through to the next case.
> 
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/watchdog/machzwd.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/machzwd.c b/drivers/watchdog/machzwd.c
> index 743377c5b173..73f2221f6222 100644
> --- a/drivers/watchdog/machzwd.c
> +++ b/drivers/watchdog/machzwd.c
> @@ -174,6 +174,7 @@ static inline void zf_set_timer(unsigned short new, unsigned char n)
>  		fallthrough;
>  	case WD2:
>  		zf_writeb(COUNTER_2, new > 0xff ? 0xff : new);
> +		fallthrough;

fallthrough to return ? Oh well, this is an old style driver anyway,
so I guess who cares.

Acked-by: Guenter Roeck <linux@roeck-us.net>

Guenter

>  	default:
>  		return;
>  	}
> -- 
> 2.27.0
> 
