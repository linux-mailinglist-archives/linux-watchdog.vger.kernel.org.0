Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0F697BEB82
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 Oct 2023 22:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378636AbjJIUUc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 9 Oct 2023 16:20:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378638AbjJIUUa (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 9 Oct 2023 16:20:30 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AADCE9
        for <linux-watchdog@vger.kernel.org>; Mon,  9 Oct 2023 13:20:27 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c17de836fbso62365971fa.1
        for <linux-watchdog@vger.kernel.org>; Mon, 09 Oct 2023 13:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1696882824; x=1697487624; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+Vz1bOKclq9QVOuzcbH1aPgn89tmrsRZHycaiZatEw=;
        b=ZXApSf+xs3DWZi9glvHF1ftND6nJHcuKyZNMhSXqRfpzyjpe56h3jtGPbf0ReTYeIR
         RoqIRMnNlo5c4iYjSTI3QLMoSrSL3Rs4N1wpJYkT7wNvk55NM8Kj09YWfoihk3uwDV0N
         j3DLQGPgNtVUZ1Xe3iQddIydsZZGVwfsNomkvREBIGMDV5eJ9Swc92sSWIp/4FFJLqSW
         cxpBEqBDyMXZseJ7uDuknWrKTq/l6vorjNDBaNeMsX/00U5lU9RwVZ4B+UfgR9Phi2Nn
         Kmrm7CQdyUv/4Oz1E2zyTUl+ziSyCKtPfjZ+tJ8buhGvk4n7GbHom+dqb86i8kTuCv48
         ctcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696882824; x=1697487624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+Vz1bOKclq9QVOuzcbH1aPgn89tmrsRZHycaiZatEw=;
        b=Hq4c8Qmmm4ki6803HKKtN9G/hkvla97MxFkA362nEjuGQrI7Mf+N6L2uI5HvXe7WFE
         7xkPbq34D5xgwHVRdTNRN8mAegYaL7XZws4p3YA9dKyGGQaERpGws/uJQj4aTzCL1h7V
         E0M2EeRm6kv/d780/iONokFD5Ti+Nblq6MSSsFtfaW+tSDncihuHFzsAG1G+DGDSZtjt
         VAaLIS1yes4+2zjBlK0TS7VLi6FKnPGLkSniiSuAbOjJ3ex0N7DfssgUTcQmUu4wetT7
         kZ7vUPAPib4tMsSVsIXA6Ru1a1QGUaGQOAMUzlGEz2ezTZz69F/t1aoxZag5JErmmH/m
         I4gQ==
X-Gm-Message-State: AOJu0YyUGo5qtAVfeW7BUVSz7BVA+O2dZh5x/o4Ex4l/HbXJNgP4LB9Q
        hvtlwmq086ZNSzZ72w4P0Uh72mGkmApd863YKx5kXg==
X-Google-Smtp-Source: AGHT+IEX6TNoPqier59OSFRvkXjcha7x9rPtvBMuDMX6o39QQshLcsk0zSX1nZ378MTMsNUvnOr8e/pohr3AIc4q14M=
X-Received: by 2002:a05:651c:120e:b0:2bf:fbe7:67dd with SMTP id
 i14-20020a05651c120e00b002bffbe767ddmr14845991lja.28.1696882824611; Mon, 09
 Oct 2023 13:20:24 -0700 (PDT)
MIME-Version: 1.0
References: <20231009165741.746184-1-max.kellermann@ionos.com>
 <20231009165741.746184-6-max.kellermann@ionos.com> <2023100921-that-jasmine-2240@gregkh>
In-Reply-To: <2023100921-that-jasmine-2240@gregkh>
From:   Max Kellermann <max.kellermann@ionos.com>
Date:   Mon, 9 Oct 2023 22:20:13 +0200
Message-ID: <CAKPOu+9=WBabTBExH1GQxhXrNH9xWciceavi6QF1nbfn9cXcig@mail.gmail.com>
Subject: Re: [PATCH 6/7] fs/sysfs/group: make attribute_group pointers const
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jens Axboe <axboe@kernel.dk>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Leon Romanovsky <leon@kernel.org>,
        Bart Van Assche <bvanassche@acm.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Ira Weiny <ira.weiny@intel.com>,
        Keith Busch <kbusch@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@arm.com>,
        Leo Yan <leo.yan@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Sebastian Reichel <sre@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-rdma@vger.kernel.org, iommu@lists.linux.dev,
        nvdimm@lists.linux.dev, linux-nvme@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-leds@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Oct 9, 2023 at 7:26=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> "*const*groups"?   That's a parsing nightmare, really hard for humans to
> read and understand.  Doesn't checkpatch complain about this?

No, checkpatch does not implement a check/warning for this style (see
my other email). There's no rule for this in coding-style.rst. Should
there be one?
