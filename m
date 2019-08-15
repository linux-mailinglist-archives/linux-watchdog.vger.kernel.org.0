Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4617A8F349
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Aug 2019 20:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731524AbfHOSZV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 15 Aug 2019 14:25:21 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44421 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729121AbfHOSZV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 15 Aug 2019 14:25:21 -0400
Received: by mail-pf1-f194.google.com with SMTP id c81so1714667pfc.11;
        Thu, 15 Aug 2019 11:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=W4m3rE5B+AHcZq7DzeAqUZniPaJlnky3nP6c268vYOA=;
        b=Ce7YxNAVpnCMGds1pqkvERXdI+89LbBYksdxZo4d6juBrMvHLbeXmQnE2KdQ+Kffa/
         eiayrpIqL0FVcv4JhPG/cUX5kRdMioO4UeS3if1NN6AoldQxlys009GFbzMPH/t56kKN
         lN8W3FsgCFlICyn4ZMxdYdbnzW1XSB4dsi62DdorO21qwxsYdQsQQ650NUz6H5mXPq3b
         t5zfeGtg+dGGaTNJ7EXIhlb/VHorbeUL14wtPtsQWETPn309LpQueh9HTEdDgnd4wVzN
         kejx+q29de+F/JnuEmWD2VQdIjrEwiCV9ZBsuToX0vKha9EzN1lTjxD/KJ8cyTiWtgqF
         Cl8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=W4m3rE5B+AHcZq7DzeAqUZniPaJlnky3nP6c268vYOA=;
        b=OKnrLTfZS4h46ry8m0PKQ64JauJp94UbAtSWRlvYyHDVcObUrJsqhScMb/Gp31xrE8
         TsijOv1jglJBnA53dN6TF4xNMeG84TMTk0gEErAI0Q3qMNJWFITythcenbu05xPQSzMb
         VUMo6CjVKBlShpmSJdQLnsGwLeoaiZtijlqmehhNTLhrHs6wsFkeE8yk5QEiuil37NN8
         TRVFpMr/nGQ0mnYK9fSuVqWqbZ+3OyCt3PZsghs2JZji3qkXESdKDCowzbjFm2ntI1qk
         Am8O00xTyu5/Mwn1TyG7naojueDVo/2iWWayIAdFw+4sr9SPKGwoM4opD6+RHkZ3wEF4
         bS0w==
X-Gm-Message-State: APjAAAUsV6Q1JhO0stfx5ZW+UGMOMp0JtHiG3fRSMhaJm94kX97l5A9a
        JzU+bExIZXFfXuEhH2SLiPI=
X-Google-Smtp-Source: APXvYqxsI+7/1KzQos22UcOs8uQRNrftaPqclP/JY+jheIxKGH2TeIv5ZI3UlZ918rzbUD1+vNAufA==
X-Received: by 2002:aa7:9882:: with SMTP id r2mr6881723pfl.146.1565893520784;
        Thu, 15 Aug 2019 11:25:20 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k5sm1907062pjl.32.2019.08.15.11.25.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 11:25:20 -0700 (PDT)
Date:   Thu, 15 Aug 2019 11:25:19 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, Chris Healy <cphealy@gmail.com>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 22/22] watchdog: ziirave_wdt: Update checked I2C
 functionality mask
Message-ID: <20190815182519.GR14388@roeck-us.net>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
 <20190812200906.31344-23-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812200906.31344-23-andrew.smirnov@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 12, 2019 at 01:09:06PM -0700, Andrey Smirnov wrote:
> Update checked I2C functionality mask to reflect all of the SMBus
> primitives used by this driver.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Rick Ramstetter <rick@anteaterllc.com>
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
