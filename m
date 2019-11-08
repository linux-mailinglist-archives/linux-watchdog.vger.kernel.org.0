Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 553D9F4E45
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 Nov 2019 15:39:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbfKHOjt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 8 Nov 2019 09:39:49 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37156 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbfKHOjt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 8 Nov 2019 09:39:49 -0500
Received: by mail-pl1-f194.google.com with SMTP id p13so4175623pll.4
        for <linux-watchdog@vger.kernel.org>; Fri, 08 Nov 2019 06:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/KJh9k2OvrpSjvajhpR5Xi8Zgvp+XEbTO1EB4h6BRwQ=;
        b=mRmAC8a1GTq4qLUXNm/SNlokuulfZtC+1IH/0hoz4EaMf8alelLFMV5xDA0HdCujd4
         04ZOxwTEIbgjiN4wQZsVtz3r2VyV/TUDLMEt9A1JdGCgV1NT+8oH2Ok/tF1A0gHM8vSV
         bmnpplwQtyPiCyFaD5lC0EfJYJAkzcjJnrXWWCh8SOXt9kabR0gQkOlpYQdGt/R2r2K2
         nzx601i6G+wcgEEptUf3DsCoFCWU3ZCSYtdyjOBAYGwSRNVFuhCLndR191MI3pa6/Om0
         GT01Lu4Wr98oaukY/N+vP6YVi9rPrtw3mmjVwcll5QRUqcAvKCrrAiGrscKZvuSwFogJ
         yesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/KJh9k2OvrpSjvajhpR5Xi8Zgvp+XEbTO1EB4h6BRwQ=;
        b=QvGTds2hNfATk0oSqSds1/j82xq6xdyzyQfEEGEvY4m4IwPyMhugWq+cA2vfWMhnoV
         tzyN17sw1NkKEW8jZ9X6OKIFu7i9nh86fZZJA5V6ymD++G3YUNXkTWOs3rIBQVQxMOtK
         ynznmlc/DY/sbwLXxmQNH62+RQ+Dssj/gYd4ul5k5FEkEn8a8TwoEz22Gl94C6I8DgAB
         gb99J5MN5Of2TEwQ9wjm+dq9hmA+Lb8UGS46uJuVHVHqzKIfiNFoQmBX5IhqADCAY9HR
         /Yci2W1yrrhaKDubvo2G0/fnpAjoQJ1Wmc6zzW8OKrnEiscRgD1C2gEBz7SwDQZ2Ow2o
         XEog==
X-Gm-Message-State: APjAAAXcoj7f9XZUScm3zbFIJXrgqO+BM0wQaAg3iQhls0deAR9EBU9i
        2zR0SmQAr+fLhb9imMWBDpE=
X-Google-Smtp-Source: APXvYqwe0JMxX5YxQH75jfx1nX5I0/LQ+0RoA3p9iMRTWa25wqwYNv8QNss2Fj/wN1Km0OvAISTBpA==
X-Received: by 2002:a17:902:ba95:: with SMTP id k21mr10756737pls.90.1573223988781;
        Fri, 08 Nov 2019 06:39:48 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r8sm6351679pgr.59.2019.11.08.06.39.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Nov 2019 06:39:47 -0800 (PST)
Subject: Re: [PATCH 1/5] watchdog: imx7ulp: Fix reboot hang
To:     Fabio Estevam <festevam@gmail.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        Yongcai Huang <Anson.Huang@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>
References: <20191029174037.25381-1-festevam@gmail.com>
 <20191102153631.GA5514@roeck-us.net>
 <CAOMZO5AvCHo6pOfX32Bz-r8AjmbuqFWc5YUho9S1Gz8Tdo2SBA@mail.gmail.com>
 <69c3f4b9-6ca5-f44d-0ebc-d6fac368ec45@roeck-us.net>
 <CAOMZO5D=7U0tbAgbx2si1f0Q7BwfZDcUb-8uJ6TBNDZDZ0K+Eg@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <5a0bab71-15b2-adbe-7d3e-30df5eae28aa@roeck-us.net>
Date:   Fri, 8 Nov 2019 06:39:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAOMZO5D=7U0tbAgbx2si1f0Q7BwfZDcUb-8uJ6TBNDZDZ0K+Eg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/7/19 9:46 AM, Fabio Estevam wrote:
> Hi Guenter,
> 
> On Mon, Nov 4, 2019 at 11:06 AM Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> Maybe I should have said "there is no call to watchdog_set_restart_priority()".
> 
> Would you like me to respin this series with a call to
> watchdog_set_restart_priority()?
> 

Your call, really. As written, the restart handler serves as restart handler
of last resort. If that is the intention we are fine.

>>> By the way, I have just noticed that even though this patch fixes the
>>> reboot on a imx7ulp evk board, it does not work on a imx7ulp com
>>> board.
>>>
>>> I will debug this, so please discard this patch for now. The other
>>> ones of this series should be fine to apply.
>>>
>>
>> Thanks for the update.
> 
> I have just retested this on a imx7ulp-com and imx7ulp-evk boards and
> the "reboot" command is working fine on the two boards.
> 
> Looks like the issue I had earlier was related to dtb.
> 

Thanks for the update!

Guenter
