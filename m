Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90DDCAAB1D
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Sep 2019 20:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390090AbfIESe7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Sep 2019 14:34:59 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46027 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732714AbfIESe7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Sep 2019 14:34:59 -0400
Received: by mail-pg1-f195.google.com with SMTP id 4so1867022pgm.12;
        Thu, 05 Sep 2019 11:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZchladH17lgsv+9UFv18PtcIdsrwGrcNNZH90IwFQ8o=;
        b=itMgs7ZGoPnYr3C6JvOpSvnTlZXckgWBCG06xyAoJfrD5f/nJCdBz9sI31US5DY9fr
         8nIxteZBJdZfwIvaxuHsDfWvb0jmpbrzQDFfZwh5aBP9ZypYFhVT6FkNxH/YZ09QFzPw
         YmuJpvEzeooN73RKEIGfqvxc+oseedw1jAfH5tXHmW9Hc6FlsCPvwUWmPkEZ6teMZFsp
         KdGAO0qGisaHIt2WWe2lKsPkX9/ePkT3L7psuc7N37rf+RrACDYkn51ER6n7TiXE6ZGk
         yraQDigI+VplyBsvznIkVg0glVd+5ODRjR1101Z7vxb6j27k8PYTwgpeXyM1O1fFgTp6
         fqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZchladH17lgsv+9UFv18PtcIdsrwGrcNNZH90IwFQ8o=;
        b=VGAWY6uwrIyUpzZxwp4AWfiDfKDgaUwcFHAe7Zh7FeK7J8ORfIWDMtTIyHlpZrm8r5
         oP5OgtDiWLFO36fhc7RPaWz+nz+yK1HTgz+X7wf6+sOKL1fJ9L2NtMCQ8gCpOx4BjAhZ
         yyUW1Xb/uv/OgrgwD6RJdHafzaTHmpsHuuz0o8VA/A5rUeAVZkSrYw2PKcS49x2mci9B
         in6HQSuobsg0rDFm4i1g9xef4g73vsnJ07SGAlqDrYUSrdMf/tuJKGaDd/uddp3gQBP0
         ue9BoNPpufB3ijkdarvHh6i59Pj1Ss0kbKXTCweDdxIXpa/zOzFnqXl8KLCFtB+Nr3H0
         ChLQ==
X-Gm-Message-State: APjAAAX+JN1Cqir3BvWknWDpLqbvKobmymVwHzr/lzC2hdhx7Or8SGZS
        SLiUA+FguZjyKcmsCtrgqdE=
X-Google-Smtp-Source: APXvYqy/t5vBCfjhGG2s/eNLQYwTQm9fpGAbsf1pVpfeajEUDUd+g2t2m1D3Xn/F9fplSwH9HQ2jrQ==
X-Received: by 2002:a63:e306:: with SMTP id f6mr4383827pgh.39.1567708498878;
        Thu, 05 Sep 2019 11:34:58 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l23sm3252427pjy.3.2019.09.05.11.34.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Sep 2019 11:34:57 -0700 (PDT)
Date:   Thu, 5 Sep 2019 11:34:56 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        wim@linux-watchdog.org, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] watchdog: qcom: support pre-timeout when the bark irq
 is available
Message-ID: <20190905183456.GA29500@roeck-us.net>
References: <20190905182419.26539-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190905182419.26539-1-jorge.ramirez-ortiz@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Sep 05, 2019 at 08:24:19PM +0200, Jorge Ramirez-Ortiz wrote:
> Use the bark interrupt as the pre-timeout notifier whenever this
> interrupt is available.
> 
> By default, the pretimeout notification shall occur one second earlier
> than the timeout.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Can you please give people time to reply before flooding the mailing list
with revisions ? This is getting annoying quite rapidly. I am going to
reply to v2, as I had started on that already (and to the one without
subject before).

Guenter
