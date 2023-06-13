Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE6C972E780
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 Jun 2023 17:41:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242338AbjFMPiB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 13 Jun 2023 11:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240171AbjFMPh7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 13 Jun 2023 11:37:59 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 031EE1FF7
        for <linux-watchdog@vger.kernel.org>; Tue, 13 Jun 2023 08:37:38 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id e9e14a558f8ab-3406c8e921fso2034185ab.0
        for <linux-watchdog@vger.kernel.org>; Tue, 13 Jun 2023 08:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686670627; x=1689262627;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AKbFs/oSeKbO6WH3jSDXeZ5tC5Pa2Etv2JU7SHAB4fk=;
        b=pur9sIjm9MnbkLWBP+xKRkhzhe1XrnfdhgP+bxJQvZ/g4e7gcCQqdZriUdAgT5lqww
         QyRYjNI7kBMNdMPS4rhjDUL41HOjunNHgFmY2RcfhTyvjKolcngRkpX3OjmsFfdSNcUp
         YMaCWGOn8Jmz2oUgaUgXCatrAl6tjR4e/C2dgrlU6n9HSal/FYmeys0A/zcCYGyuOxTm
         uZ6qzgCCe+ftQzZfiSOs2Gi3wI2mZxXkpWfCi/D+e/XQKnaQv/SH1KIv7ESBMeGnAZAL
         qEQorsnvu77SBDcnHteizxv7ngWtvdJODCfA+OtoW9HWNO8scZDhWwGv7WR2NJD/8qFf
         1ewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686670627; x=1689262627;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AKbFs/oSeKbO6WH3jSDXeZ5tC5Pa2Etv2JU7SHAB4fk=;
        b=KrPD/sh0roUCYU8weSTktkRfJkgA7WtVhGXk1RJyg8GbmoxnGAzaQG5pUPk6giTi1q
         Wz5q/9QnNE9iGx5mkAa1advIc3Ni7sFgzwMjyaDOYpDzKhYfeHGk5VhGdMBT0WcsZdtA
         31LAzzGuVLcsIx+YcNhsbxDANrsne5s8HG9XXtH5mTW4+LnrCRT2qxtSFSQhw4XQsLhD
         VQXxNtmyXgF3J8e325PCk7zlhWJnJpvuYIr1YE1NoTgjFCNaAM+upWrsEnV/YJDMYHSf
         V+EX4pJVOfIA+yBbBU07A+0A/iWZF53bEq1SiF8ZNq5V+A3FSCsnYrIOlo2JHzMayeTC
         SE7A==
X-Gm-Message-State: AC+VfDxCIgZk7oIhRcVc8uwFF1eW05jvhYbTH71oFI5zlPuPNbWslbqf
        QiyV57qGaFCroa/ila6ypAl1Gp6tA8dv5pi8WoI=
X-Google-Smtp-Source: ACHHUZ6S9KltKtE4oZoCl3owl2noBBj9wQATCC6pCpyJnIYfn/LhqEcvKzwSFifRBBCOilA+RHSZDHjlIs23KmiiX9Q=
X-Received: by 2002:a05:6e02:1301:b0:331:85fa:74c5 with SMTP id
 g1-20020a056e02130100b0033185fa74c5mr9834193ilr.1.1686670627267; Tue, 13 Jun
 2023 08:37:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6638:d55:b0:411:2930:9dda with HTTP; Tue, 13 Jun 2023
 08:37:07 -0700 (PDT)
Reply-To: missantoniaayeleobi@gmail.com
From:   Miss Antonia Ayele Obi <jameskondo32@gmail.com>
Date:   Tue, 13 Jun 2023 08:37:07 -0700
Message-ID: <CANkAqSuknEQG3gCmqVQK1bx-uJZU16Kd9e-rbd2D8P=Gcw2G0w@mail.gmail.com>
Subject: URGENT
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,HK_RANDOM_REPLYTO,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:142 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4987]
        *  1.0 HK_RANDOM_REPLYTO Reply-To username looks random
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [jameskondo32[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [jameskondo32[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

-- 
Good day,
How are you doing today, hope you are fine please i have something to
tell you. If you don't mind.

Am waiting for your response.

Best regards.

Miss Antonia Ayele Obi
