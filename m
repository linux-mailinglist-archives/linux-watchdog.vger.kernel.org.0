Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4B6386E3A
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 May 2021 02:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237278AbhERASI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 17 May 2021 20:18:08 -0400
Received: from gateway23.websitewelcome.com ([192.185.50.107]:41338 "EHLO
        gateway23.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235539AbhERASH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 17 May 2021 20:18:07 -0400
X-Greylist: delayed 1374 seconds by postgrey-1.27 at vger.kernel.org; Mon, 17 May 2021 20:18:07 EDT
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
        by gateway23.websitewelcome.com (Postfix) with ESMTP id AD4BE15796
        for <linux-watchdog@vger.kernel.org>; Mon, 17 May 2021 18:53:54 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id in3alol8ZDedfin3al2E2W; Mon, 17 May 2021 18:53:54 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=KaZSgQ5AwwL1G4KSoPBBVOyY8ngU6DX5pQRS+K4Gsp8=; b=LXF5j1v8WL1XOaR/22XEPW0FO2
        sfvoBZirqQhtHjUdNK+prxqKNQNulcOptOMZ14ko798RBwi60avG/wUFWjmFyoBLD8KdmUSvX5Mk+
        atqBqFXTlae2cb3O9iUwvDrHzyExVIbeKdvnfwDO+TOvUYBsvleDoyK13yDw9Mjp7Pefe57COxB2D
        oBe0C7bYTeyPaZFf3TXPhBoL/IRqtmwPMGT9E7WUpcMtXy4Q2CjhB3OzPoL/CgCahjpPhJK981rP7
        rwN/yYrq6x940ofwtq1e4LFAg05fZevh7cJF6zAfVyEaFhcWUJ8aP7X3TDk4LnASfaIljeBNycQnD
        8bhTS5UA==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:53332 helo=[192.168.15.8])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <gustavo@embeddedor.com>)
        id 1lin3Y-001qui-5i; Mon, 17 May 2021 18:53:52 -0500
Subject: Re: [PATCH 057/141] watchdog: Fix fall-through warnings for Clang
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
References: <cover.1605896059.git.gustavoars@kernel.org>
 <713aa26be06d50dd3bb582a3cb71f04787ad5d5b.1605896059.git.gustavoars@kernel.org>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <66f87bbf-3693-3dda-7bf4-12becb16bf31@embeddedor.com>
Date:   Mon, 17 May 2021 18:54:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <713aa26be06d50dd3bb582a3cb71f04787ad5d5b.1605896059.git.gustavoars@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1lin3Y-001qui-5i
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8]) [187.162.31.110]:53332
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 17
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi all,

I'm taking this in my -next[1] branch for v5.14.

Thanks
--
Gustavo

[1] https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git/log/?h=for-next/kspp

On 11/20/20 12:32, Gustavo A. R. Silva wrote:
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
>  	default:
>  		return;
>  	}
> 
