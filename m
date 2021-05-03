Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3773D371602
	for <lists+linux-watchdog@lfdr.de>; Mon,  3 May 2021 15:33:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233966AbhECNeW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 3 May 2021 09:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232984AbhECNeT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 3 May 2021 09:34:19 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2624AC06174A;
        Mon,  3 May 2021 06:33:24 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id i81so5390340oif.6;
        Mon, 03 May 2021 06:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rb1ViXbB4KGhWfbGPNO1lZZ3IC8up6Raq+JBW/S82Yk=;
        b=saHXvIsK28Bn1TuJpD2CtCw5avEsl3eV0CbXVJWbDA6meB39n/hMYyj9RsQ2Y03RbF
         gFDJgMcy0onMV0KHEw8j4fgSeIPzox2j87hyiufiOl+9yVsyVkdqNl93cvnVneZXF4r0
         V7sau57wmt/qwML6YsQ/nh1YZmJXVgc1Qqes2S9v4sQqmz5uryWCfraY/c8LKib/V//K
         v6Cy+DAFu9h5ZN/frmnpXlxx2NiDEnPSlf1vi20NLGpgIgJtyIzrRt0crYokI8HHEa+P
         DhW/2kPhsqcLFeYfezjVOgY+VOdY/0YnSxg5ajfAOI7UVAe+HSDSp5TBz8EGksj8qCID
         tS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rb1ViXbB4KGhWfbGPNO1lZZ3IC8up6Raq+JBW/S82Yk=;
        b=RBFCzlC+1D67FKQBcjs5aqCTlqEtO/xz+fWYKhFoPt1+r5PWHkGd0OGpeujGgFyzmJ
         SxMTPlo+ueTmOppxGnq0whmjRpEed1MqzciRsv+h1QfqIPQvkcTvFiJ3iI5V+LC5w3Rf
         FDXXYGMMr8Ov+02qdL4GHMgyEPA5TRojrM4m/ZjowmpnopRpmCkc++auUgxipzwu56RC
         7vUMCJqKiVjRUTrNL1/Fnz/SdFLROOxM7UyaKZqcMGu611k8aaLS24hulTgt9ctgWF+x
         9anRTcfbikaSHYbKkol++awE0FOeYAX8EQFOldF61SwGTFC6Cr5pGeRlym2eD8XhfmOi
         g7dw==
X-Gm-Message-State: AOAM532P5/UaqSE+I4FNdK3XU2iDdLmf57I8in5B8TqU5mzy/yPiR8ya
        Bg4oAtXiMN5C9hpJT9vpIT5Qr99yj9c=
X-Google-Smtp-Source: ABdhPJyhq4F3cmZItohjLjmwg++ntJ7GXt3tuqFGMn+vPPCij9EG+dgaQTGwYQkdAu8b/B3EcaTlew==
X-Received: by 2002:a05:6808:358:: with SMTP id j24mr13398899oie.99.1620048803538;
        Mon, 03 May 2021 06:33:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d3sm280282oic.48.2021.05.03.06.33.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 May 2021 06:33:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [RESEND PATCH v3 0/3] watchdog: f71808e_wdt: migrate to new
 kernel API
To:     Marc Kleine-Budde <mkl@pengutronix.de>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de
References: <cover.dc9133eee56aa67653455928e4de2162e344ce4d.1618310618.git-series.a.fatoum@pengutronix.de>
 <20210503130948.y7w6a2wbonr6zxzu@pengutronix.de>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <9b24f6de-c989-8055-25d7-518ff6cc3393@roeck-us.net>
Date:   Mon, 3 May 2021 06:33:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210503130948.y7w6a2wbonr6zxzu@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/3/21 6:09 AM, Marc Kleine-Budde wrote:
> On 13.04.2021 12:46:43, Ahmad Fatoum wrote:
>> This series migrates the driver to the new kernel watchdog API and
>> then to the driver model.
>>
>> Main feedback from Guenther on v2 was that I need to split it up to
>> enable review. I have done so by removing the extra refactoring for
>> now and focused on the functional changes described above. The diff
>> is now much better readable.
>>
>> I tested it on a f81866.
> 
> Is there a chance to get this series applied and mainline? Is there
> anything that's blocking it?
> 

Yes, time to review. Sorry, I am way backlogged with code reviews.

Guenter

